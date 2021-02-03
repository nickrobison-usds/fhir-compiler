open! Base

let surround p1 p2 pp_v fmt v =
  Fmt.pf fmt "%a%a%a" p1 () pp_v v p2 ()

let nline fmt _ =
  Fmt.pf fmt "%s" "\n"

(** [fmt] for adding new lines before enum cases*)
let case_sep fmt () =
  Fmt.pf fmt "@\n@\n"
