open! Base

type t = {
  name: string;
  typ: string;
  multiple: bool;
  required: bool;
}


let datatype_to_string =
  fun d ->
  let open Lib.Fhir in
  match d with
  | Base64Binary | Code | ID | Markdown | OID | String | Xhtml -> "String"
  | Boolean -> "Bool"
  | Date | DateTime | Instant | Time -> "Date"
  | Decimal -> "Double"
  | PositiveInt | UnsignedInt | Integer -> "Int"
  | URI -> "URL"
  | UUID -> "UUID"

let filter_name = function
  | "extension" -> "extension_fhir"
  | s -> s

let create name multiple typ required =
  {name = filter_name name; multiple; typ = datatype_to_string typ; required}
