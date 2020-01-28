open! Base

type t [@@deriving yojson, show, eq]

val is_primitive: string -> bool

val to_field: t -> 'a Fhir.field option
