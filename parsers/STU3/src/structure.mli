open! Base
open Lib

type t [@@deriving yojson, show, eq]

val create : string -> string -> Element.t list -> t
val name : string
val typ : t -> string
val elements : t -> Element.t list
val to_resource : t -> 'a Resource.t
val to_fhir : Yojson.Safe.t -> 'a Resource.t
