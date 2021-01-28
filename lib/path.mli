open! Base

type t [@@deriving eq, sexp]

val from_string: string -> t

val to_string: t -> string

val leading: t -> string

val trailing: t -> string

val length: t -> int

val is_parent: t -> t -> bool
