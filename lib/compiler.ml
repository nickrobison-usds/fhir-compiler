open! Base

module Make
    (P: Parser.P)
    (B: Backend.B)
= struct

  exception FileCreateion of string

  let emit_resource path resource =
    Lwt.return (B.emit path resource)

  let parse () =
    let path = match Fpath.of_string "swifts/outputs" with
      | Ok p -> p
      | _ -> raise (FileCreateion "can't")
    in
    let _ = Bos.OS.Dir.create path in
    Stdio.print_endline "Doing the parse";
    let p = P.parse () in
    let emit_resource = emit_resource path in
    (* Handle each one *)
    Lwt_stream.iter_p emit_resource p

  let parse_definition ic =
    let json = Yojson.Safe.from_channel ic in
    P.to_fhir json

  let compile file =
    let ic = Stdio.In_channel.create file in
    ( try
        let _def = parse_definition ic in
        Stdio.print_endline "Parsed:"
      (*B.emit Fmt.stdout def*)
      with End_of_file ->
        Stdio.In_channel.close ic);
    Stdio.print_endline "Done!"
end
