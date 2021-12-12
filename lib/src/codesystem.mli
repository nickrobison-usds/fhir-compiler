open! Base

type content_type = Complete | Open | Example | Fragment | NotPresent [@@deriving sexp_of]

type code = {
  code: string;
  display: string option;
  description: string option
} [@@deriving sexp_of]


type 'a t = {
  name: string;
  valueset: string option;
  description: string;
  content: content_type;
  concept: code list;
} [@@deriving sexp_of]


val make: name:string -> valueset:string option -> description:string -> content_type -> code list -> 'a t

val is_open: 'a t -> bool

val is_example: 'a t -> bool
