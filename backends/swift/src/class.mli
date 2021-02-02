open! Base

type t

val create: 'a Lib.Structure.t -> t

val name: t -> string

val emit: Stdio.Out_channel.t -> t -> unit
