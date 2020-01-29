open! Base

module Swift_compiler = struct

  module Fpath = struct
    include Fpath

    let t_of_sexp sexp =
      let str = Sexp.to_string sexp in
      match (Fpath.of_string str) with
      | Ok f -> f
      | _ -> raise (Lib.Exceptions.InvalidPath str)

    let sexp_of_t t =
      Sexp.Atom (Fpath.to_string t)
  end


  type config = Fpath.t [@@deriving sexp]

  type t = {
    output_dir: Fpath.t;
  }


  let name = "Swift"

  let create config =
    {output_dir = config}

  let surround p1 p2 pp_v fmt v =
    Fmt.pf fmt "%a%a%a" p1 () pp_v v p2 ()

  let emit: type a. t -> a Lib.Resource.t -> unit =
    fun t r ->
    let res = Resource.create r in
    Resource.emit t.output_dir res

  let commands =
    let open Cmdliner in
    Term.(ret (const (fun _ -> `Help (`Pager, None)) $ const ())),
    Term.info "swift"

end


let () =
  Lib.Backend.register (module Swift_compiler) "swift"
