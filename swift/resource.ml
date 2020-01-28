open! Base

type swift_value = {
  name: string;
  typ: string;
  multiple: bool;
  required: bool;
}

type t = {
  name: string;
  constructor: swift_value list;
  fields: swift_value list;
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


let process_field: type a. t -> a Lib.Fhir.field -> t =
  fun t field->
  match field with
  | Field field ->
    match field.datatype with
    | Scalar f -> begin
        let value = {name = field.field_path; typ = datatype_to_string f.scalar_type; multiple = false; required = f.required}
        in
        if f.required then
          {t with constructor = value :: t.constructor; fields = value :: t.fields}
        else
          {t with fields = value :: t.fields}
      end
    | Union _ -> t
    | Arity f ->
      let value = {name = f.l3; typ = datatype_to_string f.ft2; multiple = true; required = false} in
      {t with fields = value :: t.fields}
    | Complex c ->
      let value = {name = c.l; typ = c.typ; multiple = false; required = false} in
      {t with fields = value :: t.fields}


let create: type a. a Lib.Resource.t -> t =
  fun res ->
  let built = {name = res.name; constructor = []; fields = []} in
  List.fold_left res.fields ~init:built ~f:process_field

(* Resource writing *)

let surround p1 p2 pp_v fmt v =
  Fmt.pf fmt "%a%a%a" p1 () pp_v v p2 ()

let emit_maybe_multiple fmt (v: swift_value) =
  let p = if v.multiple then Fmt.brackets Fmt.string else Fmt.string in
  Fmt.pf fmt "%a" p v.typ

let emit_name_value_pair fmt (v: swift_value) =
  Fmt.pf fmt "%s: %a" v.name emit_maybe_multiple v

let emit_field_optional fmt v =
  let str = if v.required then "" else "?" in
  Fmt.pf fmt "%s" str

let emit_value fmt (v: swift_value) =
  Fmt.pf fmt "public var %a%a" emit_name_value_pair v emit_field_optional v

let emit_constructor fmt t =
  let s = Fmt.list ~sep:Fmt.comma emit_name_value_pair in
  Fmt.pf fmt "init(%a) {}" s t.constructor

let combined fmt t =
  let values = Fmt.list ~sep:Fmt.cut emit_value in
  Fmt.pf fmt "%a\n\n%a\n\n" values t.fields emit_constructor t



let emit fmt t =
  let s = Fmt.vbox (Fmt.braces (surround Fmt.cut Fmt.cut combined)) in
  Fmt.pf fmt "open class %s %a\n" t.name s t

