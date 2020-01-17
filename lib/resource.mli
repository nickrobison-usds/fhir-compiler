open! Base

type 'a t

val make: string -> 'a Fhir.field_ list -> 'a t

val emit: Formatter.t -> 'a t -> unit
