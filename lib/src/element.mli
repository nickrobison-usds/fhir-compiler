open! Base

type t [@@deriving yojson, show, eq]

val create : string -> int -> string -> string list -> t
val is_primitive_or_class : string -> bool
val to_field : t -> 'a Fhir.field option
val path : t -> Path.t
