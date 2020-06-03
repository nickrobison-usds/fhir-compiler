open! Base
open Lib
open Lwt

module STU3_Parser = struct

  type structure = {
    element: Element.t list
  } [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

  type t = {
    resourceType: string;
    id: string;
    name: string;
    snapshot: structure
  } [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

  let create typ name elements =
    {
      resourceType = typ;
      id = name;
      name = name;
      snapshot = {
        element = elements
      }
    }

  let name = "STU3"

  let typ t =
    t.resourceType

  let elements t =
    t.snapshot.element

  let handle_elements elements =
    let _previous = ref None in
    let rec h elements =
      match elements with
      | e :: lst -> Element.to_field e :: h lst
      | [] -> []
    in
    h elements


  let to_resource t =
    let name = t.name in
    let fields = List.filter_opt (handle_elements (elements t)) in
    (**let fields = List.filter_map (elements t) ~f:(fun e ->
        Element.to_field e
       ) in*)
    Resource.make name fields

  let to_fhir json =
    let t = t_of_yojson json in
    to_resource t

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
  Stdio.print_endline "Registering STU3 parser";
  Lib.Parser.register (module STU3_Parser) STU3_Parser.name
