open! Base

type 'a t = {
  name: string;
  fields: 'a Fhir.field list
} [@@deriving sexp_of]

val make: string -> 'a Fhir.field list -> 'a t

val field_by_name: 'a t -> string -> 'a Fhir.field option

val t_of_complex: 'a Fhir.fhir_datatype -> 'a t
