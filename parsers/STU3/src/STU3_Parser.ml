open! Base

module P = struct

  let name = "STU3"

  let to_resource structure =
    Structure.to_resource structure

  let to_fhir json =
    let open Yojson.Safe.Util in
    let h = to_string_option (member "resourceType" json) in
    match h with
    | Some h ->
      let f = match h with
      | "StructureDefinition" -> Structure.to_fhir json
      | s -> raise (Lib.Exceptions.UnsupportedType s)
      in
      f
    | None -> raise Lib.Exceptions.Not_Fhir

  let t_of_yojson json =
    to_fhir json

  let parse () =
    let stream, _ = Lwt_stream.create () in
    stream
end

let () =
  Lib.Parser.register (module P) P.name
