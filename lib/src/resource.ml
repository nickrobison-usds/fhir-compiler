open! Base

type 'a t = | Structure of 'a Structure.t | CodeSystem of 'a Codesystem.t [@@deriving sexp_of]
