open! Base

type t

val create: 'a Lib.Resource.t -> t

val emit_class: t -> string

val emit: Fpath.t -> t -> unit
