open! Base

type t = { name : string; typ : string; multiple : bool; required : bool }

let simple_datatype_to_string d =
  let open Lib.Simple_datatype in
  match d with
  | Base64Binary | Code | ID | Markdown | OID | String | Xhtml -> "String"
  | Boolean -> "Bool"
  | Date | DateTime | Instant | Time -> "Date"
  | Decimal -> "Double"
  | PositiveInt | UnsignedInt | Integer -> "Int"
  | URI -> "URL"
  | UUID -> "UUID"

let datatype_to_string = function
  | Lib.Datatype.Simple s -> simple_datatype_to_string s
  | Lib.Datatype.Complex c -> Lib.Complex_datatype.t_to_string c
  | Lib.Datatype.Domain d -> d

let filter_name = function
  | "extension" -> "extension_fhir"
  | s -> String.capitalize s

let create name multiple typ required =
  { name = filter_name name; multiple; typ = datatype_to_string typ; required }

(* Formatters *)

let emit_maybe_multiple fmt t =
  let p = if t.multiple then Fmt.brackets Fmt.string else Fmt.string in
  Fmt.pf fmt "%a" p t.typ

let emit_name_value_pair fmt t =
  Fmt.pf fmt "%s: %a" t.name emit_maybe_multiple t

let emit_field_optional fmt v =
  let str = if v.required then "" else "?" in
  Fmt.pf fmt "%s" str

let emit fmt t =
  Fmt.pf fmt "\npublic var %a%a" emit_name_value_pair t emit_field_optional t
