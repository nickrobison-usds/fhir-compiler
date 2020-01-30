open! Base
open Lib
open Cmdliner

exception ParseError of string
exception FileCreateion of string

let src = Logs.Src.create "Fhirc" ~doc: "FHIR Compiler"

module Log = (val Logs.src_log src : Logs.LOG)

let info fmt s =
  Log.app (fun m -> m fmt s)

let debug fmt s =
  Log.debug (fun m -> m fmt s)

let setup_log style_renderer level =
  Fmt_tty.setup_std_outputs ?style_renderer ();
  Logs.set_level level;
  Logs.set_reporter (Logs_fmt.reporter ());
  ()

let setup_log =
  Term.(const setup_log $ Fmt_cli.style_renderer () $ Logs_cli.level ())

let version =
  match (Build_info.V1.version ()) with
  | None -> "n/a"
  | Some v -> Build_info.V1.Version.to_string v

let n = Stu3.Structure.STU3_Parser.name

(* Parser selection *)
type parser_version = STU3 | R4
let parser_version_str = function
  | STU3 -> "stu3"
  | R4 -> "r4"

(* Common options *)
type copts = {file: string; parser: parser_version; backend: string}

let pr_copts fmt copts = Fmt.pr fmt "file = %s\n parser = %s" copts.file (parser_version_str copts.parser)

let copts file parser backend _logs = {file; parser; backend}

let parser_t =
  let doc = "Select parser to use." in
  let parser = Arg.enum ["stu3", STU3; "r4", R4] in
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
  match (Hashtbl.find Parser.parsers "stu3") with
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
  let exits = Term.default_exits in
  let man = [
    `S Manpage.s_bugs;
    `P "Email bug reports to <nicholas.a.robison@omb.eop.gov>."
  ] in
  parse_cmd,
  Term.info "fhirc" ~version:version ~doc ~sdocs ~exits ~man


let cmds = [Swift.Main.Swift_compiler.commands]

let () =
  Term.(exit @@ eval term)
