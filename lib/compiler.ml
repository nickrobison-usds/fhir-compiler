open! Base

module Make
    (B: Backend.B)
= struct

  let parse_definition ic =
    let json = Yojson.Safe.from_channel ic in
    Structure.t_of_yojson json

  let parse file =
    let ic = Stdio.In_channel.create file in
    ( try
        let def = parse_definition ic in
        Stdio.print_endline "Parsed:";
        B.emit Fmt.stderr (Structure.to_fhir def)
      with End_of_file ->
        Stdio.In_channel.close ic);
    Stdio.print_endline "Done!"
end
