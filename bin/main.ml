open! Base
open Lib
open Cmdliner

exception ParseError of string
exception FileCreateion of string

module C = Compiler.Make (Stu3.Structure) (Swift.Main)

let version =
  match (Build_info.V1.version ()) with
  | None -> "n/a"
  | Some v -> Build_info.V1.Version.to_string v


(* Parser selection *)
type parser_version = STU3 | R4
let parser_version_str = function
  | STU3 -> "stu3"
  | R4 -> "r4"

(* Common options *)
type copts = {file: string; parser: parser_version; backend: string}

let pr_copts fmt copts = Fmt.pr fmt "file = %s\n parser = %s" copts.file (parser_version_str copts.parser)

let copts file parser backend = {file; parser; backend}
(*
let file_t =
  let _doc = "Input file to parse." in
  Arg.(required & pos 0 (some string) None & info [] ~docv:"FILE")
*)
let parser_t =
  let doc = "Select parser to use." in
  let parser = Arg.enum ["stu3", STU3; "r4", R4] in
  Arg.(value & opt (parser) ~vopt:(STU3) STU3 & info ["p"; "parser"] ~docv:"PARSER" ~doc)

let backend_t =
  let doc = "Select backend to use." in
  Arg.(value & opt (string) ~vopt:"swift" "swift" & info ["b"; "backend"] ~docv:"BACKEND" ~doc)

let copts_t =
  Term.(const copts $ const "" $ parser_t $ backend_t)


(* Default CMD *)

let run_compiler _copts =
  Lwt_main.run (C.parse ())

let parse_cmd = Term.(const run_compiler $ copts_t)


let default_cmd =
  let doc = "FHIR language compiler" in
  let sdocs = Manpage.s_common_options in
  let exits = Term.default_exits in
  let man = [
    `S Manpage.s_bugs;
    `P "Email bug reports to <nicholas.a.robison@omb.eop.gov>."
  ] in
  parse_cmd,
  Term.info "fhirc" ~version:version ~doc ~sdocs ~exits ~man

let cmds = [Swift.Main.commands]

let () =
  (*Stdio.print_endline "Running";
    let _path = match Fpath.of_string "swifts/outputs" with
    | Ok p -> p
    | _ -> raise (FileCreateion "can't")
    in
    C.parse () >>= fun () -> Stdio.print_endline "Finished";
    Lwt.return_unit*)
  (*;*)
  Term.(exit @@ eval default_cmd)
