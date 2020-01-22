open! Base

module type P = sig

  val to_fhir: Yojson.Safe.t -> 'a Resource.t
end
