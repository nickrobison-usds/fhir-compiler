open Exceptions

type datatype =
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
  | Xhtml

let datatype_of_string = function
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

let datatype_to_string dt =
  match dt with
  | String -> "string"
  | Integer -> "integer"
  | _ -> raise (UnsupportedType "Can't with it")
