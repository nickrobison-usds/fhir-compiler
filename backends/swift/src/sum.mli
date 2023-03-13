open! Base

module Option : sig
  type t

  val create : string -> string -> t
  val pp : Formatter.t -> t -> unit
  val t_of_datatype : 'a Lib.Fhir.fhir_datatype -> t
end

type t

val create : string -> Option.t list -> t
val t_of_union : string -> t
val pp : Formatter.t -> t -> unit
