open! Base

exception UnsupportedType of string

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

type 'a record = {
  record_path: string;
  fields: 'a fhir_datatype list;
}
and ('a, 'b) field_ = {
  path: Path.t;
  id: string;
  datatype: 'a fhir_datatype
}
and 'a field =
  | Field: ('a, 'b) field_ -> 'a field
and 'a fhir_datatype =
  | Scalar: ('a, 'b) scalar -> 'a fhir_datatype
  | Union: ('a, 'b) union -> 'a fhir_datatype
  | Arity: ('a, 'b) arity -> 'a fhir_datatype
  | Complex: ('a, 'b) complex -> 'a fhir_datatype
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
and ('a, 'b) complex = {
  l: string;
  typ: string;
}
