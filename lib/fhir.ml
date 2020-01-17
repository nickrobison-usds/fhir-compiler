open! Base

exception UnsupportedType of string

type datatype =
  | Boolean
  | Integer
  | String
  | Decimal

let datatype_of_string = function
  | "boolean" -> Boolean
  | "string" -> String
  | "integer" -> Integer
  | "decimal" -> Decimal
  | _  -> String

let datatype_to_string = function
  | Boolean -> "boolean"
  | Integer -> "integer"
  | String -> "string"
  | Decimal -> "decimal"

type 'a record = {
  path: string;
  fields: 'a field_ list;
}
and 'a field_ =
  | Field: ('a, 'b) field -> 'a field_
and ('a, 'b) field = {
  label: string;
  field_type: datatype
}

