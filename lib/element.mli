open! Base

type t [@@deriving yojson, show, eq]

val to_field: t -> 'a Fhir.field_ option
