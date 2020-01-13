open! Core

type t [@@deriving yojson {strict = false}, show, eq]

val create: string -> t
