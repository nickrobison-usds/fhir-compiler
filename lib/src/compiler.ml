open! Base

module Make (P : Parser.P) (B : Backend.B) = struct
  exception FileCreation of string

  let emit_resource path resource = Lwt.return (B.emit path resource)

  let filter_examples : type a. a Resource.t -> bool =
   fun r ->
    match r with CodeSystem c -> not (Codesystem.is_example c) | _ -> true

  let parse backend =
    let path =
      match Fpath.of_string "swifts/outputs" with
      | Ok p -> p
      | _ -> raise (FileCreation "can't")
    in
    let _ = Bos.OS.Dir.create path in
    let p = P.parse () in
    let emit_resource = emit_resource backend in
    (* Handle each one *)
    Lwt_stream.filter filter_examples p |> Lwt_stream.iter_p emit_resource

  let parse_definition ic =
    let json = Yojson.Safe.from_channel ic in
    P.to_fhir json

  let compile file =
    let ic = Stdio.In_channel.create file in
    (try
       let _def = parse_definition ic in
       Stdio.print_endline "Parsed:"
       (*B.emit Fmt.stdout def*)
     with End_of_file -> Stdio.In_channel.close ic);
    Stdio.print_endline "Done!"
end
