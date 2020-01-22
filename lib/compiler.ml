open! Base

module Make
    (P: Parser.P)
    (B: Backend.B)
= struct

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
