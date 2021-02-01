open! Base

let () =
  let args = Array.to_list (Sys.get_argv ()) in
  if (List.length args) <> 2 then
    raise (Invalid_argument "Missing command line arguments")

  else
    ()
