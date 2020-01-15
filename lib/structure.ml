open! Base

type structure = {
  element: Element.t list
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

type t = {
  resourceType: string;
  id: string;
  name: string;
  snapshot: structure
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]


let create greeting =
  {resourceType = greeting; id = greeting; name = greeting; snapshot = {element = []}}

let typ t =
  t.resourceType

let elements t =
  t.snapshot.element

let to_fhir t =
  let name = typ t in
  let fields = List.filter_map (elements t) ~f:(fun e ->
      match (Element.to_field e) with
      | Some e ->  Some (Fhir.Packed e)
      | None -> None
      ) in
  Fhir.Resource.make name fields
