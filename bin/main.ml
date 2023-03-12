open! Base
open Lib
open Cmdliner

exception ParseError of string
exception FileCreateion of string

let src = Logs.Src.create "Fhirc" ~doc: "FHIR Compiler"

module Log = (val Logs.src_log src : Logs.LOG)


let reporter ppf =
  let report src level ~over k msgf =
    let k _ = over (); k () in
    let with_stamp h _tags k ppf fmt =
      (* This is bad, should not use deprecated features*)
      let open Caml in
      Format.kfprintf k ppf ("%a[%s] @[" ^^ fmt ^^ "@]@.")
        Logs.pp_header (level, h) (Logs.Src.name src)
    in
    msgf @@ fun ?header ?tags fmt -> with_stamp header tags k ppf fmt
  in
  { Logs.report = report }

let info fmt s =
  Log.warn (fun m -> m fmt s)

let debug fmt s =
  Log.debug (fun m -> m fmt s)

(* We need to disable library logging, otherwise CoHTTP logs the entire payloard, but we want our applications to work correctly.*)
let enable_app_logging level =
  let re = Re.Perl.compile_pat "^fhirc.*" in
  List.iter (Logs.Src.list ()) ~f:(fun s ->
      match (Re.matches re (Logs.Src.name s)) with
      | [] -> ()
      | _ -> Logs.Src.set_level s level
    )

let setup_log style_renderer level =
  Fmt_tty.setup_std_outputs ?style_renderer ();
  Logs.set_level (Some Logs.Warning);
  enable_app_logging level;
  Logs.set_reporter (reporter Fmt.stdout);
  ()

let setup_log =
  Term.(const setup_log $ Fmt_cli.style_renderer () $ Logs_cli.level ())

let version =
  match (Build_info.V1.version ()) with
  | None -> "n/a"
  | Some v -> Build_info.V1.Version.to_string v

let n = Stu3.STU3_Parser.P.name

(* Parser selection *)
type parser_version = STU3 | R4
let parser_version_str = function
  | STU3 -> "STU3"
  | R4 -> "R4"

(* Common options *)
type copts = {file: string; parser: parser_version; backend: string}

let pr_copts fmt copts = Fmt.pr fmt "file = %s\n parser = %s" copts.file (parser_version_str copts.parser)

let copts file parser backend _logs = {file; parser; backend}

let parser_t =
  let doc = "Select parser to use." in
  let parser = Arg.enum ["STU3", STU3; "R4", R4] in
  Arg.(value & opt (parser) ~vopt:(STU3) STU3 & info ["p"; "parser"] ~docv:"PARSER" ~doc)

let backend_t =
  let doc = "Select backend to use." in
  Arg.(required & pos 0 (some string) None & info [] ~docv:"BACKEND" ~doc)

let copts_t =
  Term.(const copts $ const "" $ parser_t $ backend_t $ setup_log)

(* Default CMD *)
let run_compiler copts =
  info "Generating: %s\n" copts.backend;
  let _path = match Fpath.of_string "swifts/outputs" with
    | Ok p -> p
    | _ -> raise (FileCreateion "can't")
  in
  match (Hashtbl.find Parser.parsers "STU3") with
  | None -> raise (FileCreateion "Cannot find parser")
  | Some (module P: Parser.P) ->
    begin
      match (Hashtbl.find Backend.backends copts.backend) with
      | Some (module B: Backend.B) ->
        begin
          let config = Sexp.Atom "swifts/outputs" in
          let s = B.create (B.config_of_sexp config) in
          let module C = Compiler.Make(P)(B) in
          Lwt_main.run (C.parse s)
        end
      | None -> raise (FileCreateion "Cannot find backend")
    end

let parse_cmd = Term.(const run_compiler $ copts_t)

let term =
  let doc = "FHIR language compiler" in
  let sdocs = Manpage.s_common_options in
  let exits = Cmd.Exit.defaults in
  let man = [
    `S Manpage.s_bugs;
    `P "Email bug reports to <nicholas.a.robison@omb.eop.gov>."
  ] in
  let info = Cmd.info "fhirc" ~version:version ~doc ~sdocs ~exits ~man in
  Cmd.v info parse_cmd
  


let cmds = [Swift.Main.Swift_compiler.commands]

let () =
  Caml.exit (Cmd.eval term)
