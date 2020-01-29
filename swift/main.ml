open! Base

type config = Fpath.t

type t = {
  output_dir: Fpath.t;
}

let name = "Swift"

let create config =
  {output_dir = config}

let surround p1 p2 pp_v fmt v =
  Fmt.pf fmt "%a%a%a" p1 () pp_v v p2 ()

let emit: type a. Fpath.t -> a Lib.Resource.t -> unit =
  fun fmt r ->
  let res = Resource.create r in
  Resource.emit fmt res

let commands =
  let open Cmdliner in
  Term.(ret (const (fun _ -> `Help (`Pager, None)) $ const ())),
  Term.info "swift"
