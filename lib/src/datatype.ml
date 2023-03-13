open! Base

type t =
  | Simple of Simple_datatype.t
  | Complex of Complex_datatype.t
  | Domain of string
[@@deriving sexp]

let t_of_string code =
  try Simple (Simple_datatype.t_of_string code)
  with Exceptions.UnsupportedType _ -> (
    try Complex (Complex_datatype.t_of_string code)
    with Exceptions.UnsupportedType _ -> Domain code)

let t_to_string = function
  | Simple p -> Simple_datatype.t_to_string p
  | Complex c -> Complex_datatype.t_to_string c
  | Domain d -> d
