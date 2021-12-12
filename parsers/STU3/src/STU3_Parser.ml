open! Base
open Lwt.Infix

let src = Logs.Src.create "parser.STU3" ~doc: "STU3 Parser"

module Log = (val Logs.src_log src: Logs.LOG)

module P = struct

  let name = "STU3"

  let to_resource structure =
    Structure.to_resource structure

  let to_fhir json =
    let open Yojson.Safe.Util in
    let h = to_string_option (member "resourceType" json) in
    match h with
    | Some h ->
      let n = to_string (member "name" json) in
      Log.warn (fun m -> m"Parsing: `%s` of type: `%s`" n h);
      let f = match h with
        | "StructureDefinition" -> Structure.to_fhir
        | "CodeSystem" -> Codesystem.to_fhir
        | s -> raise (Lib.Exceptions.UnsupportedType s)
      in
      f json
    | None -> raise Lib.Exceptions.Not_Fhir

  let t_of_yojson json =
    to_fhir json

  let parse () =
    let stream, pusher = Lwt_stream.create () in
    let _ = Downloader.download "http://hl7.org/fhir/STU3/examples-json.zip" >>= fun pth ->
      Downloader.unzip pth pusher;
      Lwt.return_unit
    in
    stream
    |> Lwt_stream.map Yojson.Safe.from_string
    |> Lwt_stream.map to_fhir

end

let () =
  Lib.Parser.register (module P) P.name
