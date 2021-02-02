open! Base

module S = Swift

let create_print = function
  | Lib.Resource.Structure s -> S.Class.create s |> S.Class.emit_class |> Stdio.print_endline
  | Lib.Resource.CodeSystem c -> S.Enum.create c |> S.Enum.emit Stdio.stdout

let () =
  let args = Array.to_list (Sys.get_argv ()) in
  if (List.length args) <> 2 then
    raise (Invalid_argument "Missing command line arguments")

  else
    let r = List.nth_exn args 1 and
    table = Resources.v () in
    Hashtbl.find_exn table r
    |>  create_print
