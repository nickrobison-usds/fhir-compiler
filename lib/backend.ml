open! Base

module type B = sig
  val name: unit -> string

  val emit: Formatter.t -> 'a Resource.t -> unit
end

let backends: (string, (module B)) Hashtbl.t = Hashtbl.create (module String)


let register (module Backend: B) backend name =
  Hashtbl.add backends ~key:name ~data:backend
