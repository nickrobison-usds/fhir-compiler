open! Base

type t

val make: string -> Fhir.packed list -> t

val emit: Formatter.t -> t -> unit
