open! Base

type t [@@deriving yojson, show, eq]

val create: string -> t

val to_field: t -> 'a Fhir.field option
