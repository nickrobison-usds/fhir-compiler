open! Base
open Lib
open Lwt
open Cohttp_lwt_unix

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

let body_writer body =
  let open Stdio.Out_channel in
  let oc = create "test/nothing" in
  output_string oc body;
  close oc;
  Lwt.return_unit

let parse () =
  Client.get (Uri.of_string "http://hl7.org/fhir/STU3/examples-json.zip") >>= fun (_resp, body) ->
  Cohttp_lwt.Body.write_body body_writer body >>= fun () -> Lwt.return []
