open! Base

module type B = sig
  val name: string

  val emit: Fpath.t -> 'a Resource.t -> unit

  val commands: ('a Cmdliner.Term.t * Cmdliner.Term.info)

end

let backends: (string, (module B)) Hashtbl.t = Hashtbl.create (module String)

let register (module Backend: B) backend name =
  Hashtbl.add backends ~key:name ~data:backend
