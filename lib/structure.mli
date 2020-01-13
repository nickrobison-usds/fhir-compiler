open! Core

type t [@@deriving yojson, show, eq]


val create: string -> t

val typ: t -> string

val elements: t -> Element.t list
