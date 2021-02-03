open! Base

let src = Logs.Src.create "backend.swift" ~doc: "Swift backend"

module Log = (val Logs.src_log src : Logs.LOG)

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

  let emit_to_file pth name emitter res =
    let path = Fpath.add_seg pth (Fmt.str "%s.swift" name)
               |> Fpath.to_string

    in
    Log.debug (fun f -> f "Writing to %s" path);
    Stdio.Out_channel.with_file path ~f:(fun oc -> emitter oc res)

  let emit: type a. t -> a Lib.Resource.t -> unit =
    fun t r ->
    let file_out = emit_to_file t.output_dir in
    match r with
    | Structure r ->
      let res = Class.create r in
      file_out (Class.name res) Class.emit res
    | CodeSystem c ->
      let res = Enum.create c in
      emit_to_file t.output_dir (Enum.name res) Enum.emit res


  let commands =
    let open Cmdliner in
    Term.(ret (const (fun _ -> `Help (`Pager, None)) $ const ())),
    Term.info "swift"

end

let () =
  Lib.Backend.register (module Swift_compiler) Swift_compiler.name
