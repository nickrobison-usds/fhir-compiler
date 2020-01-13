open! Core

type structure = {
  element: Element.t list
} [@@deriving yojson {strict = false}, show, eq]

type t = {
  resourceType: string;
  id: string;
  name: string;
  snapshot: structure
} [@@deriving yojson {strict = false}, show, eq]


let create greeting =
  {resourceType = greeting; id = greeting; name = greeting; snapshot = {element = []}}

let typ t =
  t.resourceType

let elements t =
  t.snapshot.element
