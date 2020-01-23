open! Base

type swift_value = {
  name: string;
  typ: string;
  multiple: bool;
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
  | Boolean -> "Bool"
  | Integer -> "Int"
  | String -> "String"
  | Decimal -> "Float"


let process_field: type a. t -> a Lib.Fhir.field_ -> t =
  fun t field ->
  match field with
  | Scalar f -> begin
      let value = {name = f.label; typ = datatype_to_string f.field_type; multiple = false}
      in
      if f.required then
        {t with constructor = value :: t.constructor; fields = value :: t.fields}
      else
        {t with fields = value :: t.fields}
    end
  | Union _ -> t
  | Arity f ->
    let value = {name = f.l3; typ = datatype_to_string f.ft2; multiple = true} in
    {t with fields = value :: t.fields}



let create: type a. a Lib.Resource.t -> t =
  fun res ->
  let built = {name = res.name; constructor = []; fields = []} in
  List.fold_left res.fields ~init:built ~f:process_field

(* Resource writing *)

let emit_name_value_pair fmt (v: swift_value) =
  Fmt.pf fmt "%s: %s" v.name v.typ

let emit_value fmt (v: swift_value) =
  Fmt.pf fmt "public var %a" emit_name_value_pair v

let emit_constructor fmt t =
  let s = Fmt.list ~sep:Fmt.comma emit_name_value_pair in
  Fmt.pf fmt "init(%a)" s t.constructor

let combined fmt t =
  let values = Fmt.list ~sep:Fmt.comma emit_value in
  Fmt.pf fmt "%a\n\n%a\n\n" values t.fields emit_constructor t

let surround p1 p2 pp_v fmt v =
  Fmt.pf fmt "%a%a%a" p1 () pp_v v p2 ()

let emit fmt t =
  let s = Fmt.vbox (Fmt.braces (surround Fmt.cut Fmt.cut combined)) in
  Fmt.pf fmt "open class %s %a\n" t.name s t

