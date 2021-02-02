open! Base

type 'a t = | Structure of 'a Structure.t [@@deriving sexp_of]
