open! Base

let src = Logs.Src.create "fhirc.backend.swift.resource" ~doc:"Swift backend resource emitter"

module Log = (val Logs.src_log src : Logs.LOG)

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

let filter_name = function
  | "extension" -> "extension_fhir"
  | s -> s


let process_field: type a. Lib.Path.t -> t -> a Lib.Fhir.field -> t =
  fun _path t field->
  match field with
  | Field field ->
    if Lib.Path.length field.path > 2 then
      begin
        Log.debug (fun f -> f "Skipping field: %s" (Lib.Path.to_string field.path));
        t
      end
    else
      begin
        match field.datatype with
        | Scalar f -> begin
            let value = {name = filter_name (Lib.Path.trailing field.path); typ = datatype_to_string f.scalar_type; multiple = false; required = f.required}
            in
            if f.required then
              {t with constructor = value :: t.constructor; fields = value :: t.fields}
            else
              {t with fields = value :: t.fields}
          end
        | Union _ -> t
        | Arity f ->
          let value = {name = filter_name f.l3; typ = datatype_to_string f.ft2; multiple = true; required = false} in
          {t with fields = value :: t.fields}
        | Complex c ->
          let value = {name = filter_name c.l; typ = c.typ; multiple = false; required = false} in
          {t with fields = value :: t.fields}
      end


let create: type a. a Lib.Resource.t -> t =
  fun res ->
  let path = Lib.Path.from_string res.name in
  let built = {name = res.name; constructor = []; fields = []} in
  let process_field = process_field path in
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

let nline fmt _ =
  Fmt.pf fmt "%s" "\n"

let combined fmt t =
  let values = Fmt.list ~sep:nline emit_value in
  Fmt.pf fmt "\n%a\n\n%a\n\n" values t.fields emit_constructor t

let write_to_file t =
  fun oc ->
  let s = Fmt.vbox (Fmt.braces (surround Fmt.cut Fmt.cut combined)) in
  let str = Fmt.str "open class %s %a\n" t.name s t in
  Stdio.Out_channel.output_string oc str

let emit path t =
  let path = Fpath.add_seg path  (Fmt.str "%s.swift" t.name) in
  Stdio.printf "Writing to %s\n" (Fpath.to_string path);
  let write_to_file = write_to_file t in
  Stdio.Out_channel.with_file (Fpath.to_string path) ~f:write_to_file
