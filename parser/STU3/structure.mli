open! Base
open Lib

type t [@@deriving yojson, show, eq]


val create: string -> t

val typ: t -> string

val elements: t -> Element.t list

val to_fhir: Yojson.Safe.t -> 'a Resource.t
