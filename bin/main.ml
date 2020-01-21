open! Base
open Lib
open Cmdliner

exception ParseError of string

module P = Compiler.Make(Swift.Main)


let file =
  let _doc = "Input file to parse." in
  Arg.(required & pos 0 (some string) None & info [] ~docv:"FILE")

let version =
  match (Build_info.V1.version ()) with
  | None -> "n/a"
  | Some v -> Build_info.V1.Version.to_string v

let parse_t = Term.(const P.parse $ file)

let info =
  let doc = "FHIR language compiler" in
  let man = [
    `S Manpage.s_bugs;
    `P "Email bug reports to <nicholas.a.robison@omb.eop.gov>."
  ] in
  Term.info "fhirc" ~version ~doc ~exits: Term.default_exits ~man

let () =
  Term.exit @@ Term.eval (parse_t, info)
