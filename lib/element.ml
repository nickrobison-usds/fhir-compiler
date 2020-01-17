open! Base

exception JsonConversionException of string

module Uri = struct
  include Uri

  let yojson_of_t t =
    `String (Uri.to_string t)

  let t_of_yojson json =
    match json with
    | `String s -> Uri.of_string s
    | _ -> raise (JsonConversionException "Cannot convert")
end

type typ = {
  code: string;
  profile: Uri.t option [@default None];
  targetProfile: Uri.t option [@default None];
  aggregation: string list [@default []];
  versioning: string option [@default None];
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]



type t = {
  path: string;
  id: string;
  short_description: string option [@key "short"];
  typ: typ list [@default []] [@key "type"];
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]


let create hello =
  {path = hello; id = hello; short_description = (Some hello); typ = []}

let emit_field t code =
  let ts = Fhir.Scalar{
      name = code;
      emit = fun c -> c;
    } in
  Fhir.Field {
    name = t.id;
    output_typ = ts;
    fhir_type = Fhir.datatype_of_string code;
  }

let to_field t =
  match List.hd t.typ with
  | Some code -> Some (emit_field t code.code)
  | None -> None

let emit fmt t =
  match t with
  | Fhir.Packed (Field {name; fhir_type; _}) -> Fmt.pf fmt "public var %s: %s" name (Fhir.datatype_to_string fhir_type)
