open! Base

type t [@@deriving yojson, show, eq]


val create: string -> t

val typ: t -> string

val elements: t -> Element.t list

val to_fhir: t -> Resource.t
