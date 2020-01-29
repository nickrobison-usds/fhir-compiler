open! Base

module type P = sig

  val parse: unit -> 'a Resource.t Lwt_stream.t

  val to_fhir: Yojson.Safe.t -> 'a Resource.t
end
