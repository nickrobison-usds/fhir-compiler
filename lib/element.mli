open! Base

type t [@@deriving yojson, show, eq]

val to_field: t -> 'a Fhir.field_ option

val emit: Formatter.t -> 'a Fhir.field_ -> unit
