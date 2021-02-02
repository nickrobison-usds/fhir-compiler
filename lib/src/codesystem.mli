open! Base

type content_type = Complete | Open [@@deriving sexp_of]

type code = {
  code: string;
  display: string;
  description: string
} [@@deriving sexp_of]


type 'a t = {
  name: string;
  valueset: string;
  description: string;
  content: content_type;
  concept: code list;
} [@@deriving sexp_of]


val make: name:string -> valueset:string -> description:string -> content_type -> code list -> 'a t

val is_open: 'a t -> bool
