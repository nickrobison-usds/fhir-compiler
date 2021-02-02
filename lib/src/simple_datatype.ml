open! Base
open Exceptions

type t =
  | Base64Binary
  | Boolean
  | Code
  | Date
  | DateTime
  | Decimal
  | ID
  | Instant
  | Integer
  | Markdown
  | OID
  | PositiveInt
  | String
  | Time
  | UnsignedInt
  | URI
  | UUID
  | Xhtml [@@deriving sexp]

let t_of_string = function
  | "base64Binary" -> Base64Binary
  | "boolean" -> Boolean
  | "code" -> Code
  | "date" -> Date
  | "dateTime" -> DateTime
  | "decimal" -> Decimal
  | "id" -> ID
  | "instant" -> Instant
  | "integer" -> Integer
  | "markdown" -> Markdown
  | "oid" -> OID
  | "positiveInt" -> PositiveInt
  | "string" -> String
  | "time" -> Time
  | "unsignedInt" -> UnsignedInt
  | "uri" -> URI
  | "uuid" -> UUID
  | "xhtml" -> Xhtml
  | s -> raise (UnsupportedType s)

let t_to_string dt =
  match dt with
  | Base64Binary -> "base64Binary"
  | String -> "string"
  | Integer -> "integer"
  | _ -> raise (UnsupportedType "Can't with it")
