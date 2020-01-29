open! Base

module type B = sig
  type config
  type t

  val create: config -> t
  val name: string

  val emit: Fpath.t -> 'a Resource.t -> unit

  val commands: ('a Cmdliner.Term.t * Cmdliner.Term.info)

end

module type Backend_instance = sig
  module Backend: B
  val this: Backend.t
end


let build_backend (type a) (module B: B with type config = a)
    config =
  (module struct
    module Backend = B
    let this = B.create config
  end: Backend_instance)

let backends: (string, (module Backend_instance)) Hashtbl.t = Hashtbl.create (module String)

let register (module Backend: B) backend name =
  Hashtbl.add backends ~key:name ~data:backend
