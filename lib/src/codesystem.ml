open! Base

type content_type = Complete | Open | Example | Fragment | NotPresent
[@@deriving sexp_of]

type code = {
  code : string;
  display : string option;
  description : string option;
}
[@@deriving sexp_of]

type 'a t = {
  name : string;
  valueset : string option;
  description : string;
  content : content_type;
  concept : code list;
}
[@@deriving sexp_of]

let make ~name ~valueset ~description content concept =
  { name; valueset; description; content; concept }

let is_open t = match t.content with Complete -> false | _ -> true
let is_example t = match t.content with Example -> true | _ -> false
