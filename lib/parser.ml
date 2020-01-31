open! Base

module type P = sig

  val name: string

  val parse: unit -> 'a Resource.t Lwt_stream.t

  val to_fhir: Yojson.Safe.t -> 'a Resource.t
end

let parsers: (string, (module P)) Hashtbl.t = Hashtbl.create (module String)

let register parser name =
  match (Hashtbl.add parsers ~key:name ~data:parser) with
  | `Ok -> ()
  | `Duplicate -> raise (Exceptions.DuplicateParser name)
