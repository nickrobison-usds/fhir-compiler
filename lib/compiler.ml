open! Base
open Lwt

module Make
    (P: Parser.P)
    (B: Backend.B)
= struct

  let parse () =
    Stdio.print_endline "Doing the parse";
    P.parse () >>= fun p ->
    Stdio.print_endline (Int.to_string (List.length p));
    Lwt.return_unit

  let parse_definition ic =
    let json = Yojson.Safe.from_channel ic in
    P.to_fhir json

  let compile file =
    let ic = Stdio.In_channel.create file in
    ( try
        let def = parse_definition ic in
        Stdio.print_endline "Parsed:";
        B.emit Fmt.stdout def
      with End_of_file ->
        Stdio.In_channel.close ic);
    Stdio.print_endline "Done!"
end
