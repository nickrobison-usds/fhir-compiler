open! Core

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
  code: Uri.t;
  profile: Uri.t option [@default None];
  targetProfile: Uri.t option [@default None];
  aggregation: string list [@default []];
  versioning: string option [@default None];
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]



type t = {
  path: string;
  id: string;
  short_description: string option [@key "short"];
  typ: typ list [@default []] [@key "types"];
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]


let create hello =
  {path = hello; id = hello; short_description = (Some hello); typ = []}

let to_field t =
  Some (Fhir.Field {
    name = t.id;
    output_typ = Fhir.boolean;
  })
