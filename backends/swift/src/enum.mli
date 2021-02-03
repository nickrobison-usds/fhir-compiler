open! Base

type t

val create: 'a Lib.Codesystem.t -> t

val name: t -> string

val emit: Stdio.Out_channel.t -> t -> unit
