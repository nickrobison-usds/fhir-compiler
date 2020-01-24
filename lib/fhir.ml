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
  fields: 'a fhir_datatype list;
}
and ('a, 'b) field_ = {
  id: string;
  field_path: string;
  datatype: 'a fhir_datatype
}
and 'a field =
  | Field: ('a, 'b) field_ -> 'a field
and 'a fhir_datatype =
  | Scalar: ('a, 'b) scalar -> 'a fhir_datatype
  | Union: ('a, 'b) union -> 'a fhir_datatype
  | Arity: ('a, 'b) arity -> 'a fhir_datatype
and ('a, 'b) scalar = {
  scalar_type: datatype;
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
  field_types: 'a fhir_datatype list;
}
