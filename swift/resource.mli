open! Base

type t

val create: 'a Lib.Resource.t -> t

val emit: Formatter.t -> t -> unit
