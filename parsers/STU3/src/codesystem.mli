open! Base
open Lib

type concept [@@deriving yojson, show, eq]

type t [@@deriving yojson, show, eq]

val typ: string

val to_fhir: Yojson.Safe.t -> 'a Resource.t
