open! Base

type t

val create: 'a Lib.Resource.t -> t

val emit: Fpath.t -> t -> unit
