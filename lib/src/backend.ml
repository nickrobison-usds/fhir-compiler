open! Base

let src = Logs.Src.create "compiler.backends" ~doc: "Backend code generation manager"

module Log = (val Logs.src_log src: Logs.LOG)

exception DuplicateBackend of string

module type B = sig
  type config [@@deriving sexp]
  type t

  val create: config -> t
  val name: string

  val emit: t -> 'a Resource.t -> unit

  val commands: ('a Cmdliner.Term.t * Cmdliner.Term.info)

end

let backends: (string, (module B)) Hashtbl.t = Hashtbl.create (module String)

let register backend name =
  Log.debug (fun m -> m "Registering backend: `%s`" name);
  match (Hashtbl.add backends ~key:name ~data:backend) with
  | `Ok -> ()
  | `Duplicate -> raise (DuplicateBackend "Backend already exists")
