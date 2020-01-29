open! Base
open Lib

module STU3_Parser: sig

  type t [@@deriving yojson, show, eq]

  val name: string

  val typ: t -> string

  val elements: t -> Element.t list

  val to_fhir: Yojson.Safe.t -> 'a Resource.t

  val parse: unit -> 'a Resource.t Lwt_stream.t
end

