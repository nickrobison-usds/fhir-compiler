open! Base
open Lib
open Lwt

type structure = {
  element: Element.t list
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

type t = {
  resourceType: string;
  id: string;
  name: string;
  snapshot: structure
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]


let typ t =
  t.resourceType

let elements t =
  t.snapshot.element

let to_fhir json =
  let t = t_of_yojson json in
  let name = t.name in
  let fields = List.filter_map (elements t) ~f:(fun e ->
      Element.to_field e
    ) in
  Resource.make name fields



let parse () =
  let stream, pusher = Lwt_stream.create () in
  let _ = Downloader.download "http://hl7.org/fhir/STU3/examples-json.zip" >>= fun pth ->
    Downloader.unzip pth pusher;
    Lwt.return_unit
  in
  stream
  |> Lwt_stream.map Yojson.Safe.from_string
  |> Lwt_stream.map to_fhir
