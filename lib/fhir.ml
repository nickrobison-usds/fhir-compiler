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
  | Boolean -> "Bool"
  | Integer -> "Int"
  | String -> "String"
  | Decimal -> "Float"

type 'a record = {
  path: string;
  fields: 'a field_ list;
}
and 'a field_ =
  | Scalar: ('a, 'b) scalar -> 'a field_
  | Union: ('a, 'b) union -> 'a field_
  | Arity: ('a, 'b) arity -> 'a field_
and ('a, 'b) scalar = {
  label: string;
  field_type: datatype;
  required: bool;
}
and ('a, 'b) arity = {
  l3: string;
  min: int;
  max: string;
  ft2: datatype
}
and ('a, 'b) union = {
  l2: string;
  field_types: datatype list;
}
