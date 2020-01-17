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
  min: int;
  max: string;
} [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

let emit_scalar t code =
  Fhir.Scalar {
    label = t.id;
    field_type = Fhir.datatype_of_string code;
    required = Int.(>=) 1 t.min;
  }

let emit_arity t code =
  Fhir.Arity {
    l3 = t.id;
    min = t.min;
    max = t.max;
    ft2 = Fhir.datatype_of_string code;
  }

let emit_single t code =
  match t.max with
  | "1" -> emit_scalar t code
  | _ -> emit_arity t code

let emit_union t typs =
  let l = List.map ~f:(fun f -> f.code) typs in
  Fhir.Union {
    field_types = List.map ~f:Fhir.datatype_of_string l;
    l2 = t.id;
  }

let to_field t =
  match t.typ with
  | [] -> None
  | [x] ->  Some (emit_single t x.code)
  | x -> Some (emit_union t x)


(** Emit an ampersand.*)
let ampersand fmt _ =
  Fmt.pf fmt " || "


let emit: type a. Formatter.t -> a Fhir.field_ -> unit =
  fun fmt t -> match t with
    | Scalar f ->  Fmt.pf fmt "public var %s: %s" f.label (Fhir.datatype_to_string f.field_type)
    | Union f -> (
        let l = List.map ~f:Fhir.datatype_to_string f.field_types in
        let s = Fmt.list ~sep:ampersand Fmt.string in
        Fmt.pf fmt "public var %s: %a" f.l2 s l
      )
    | Arity a -> Fmt.pf fmt "public var %s: [%s]" a.l3 (Fhir.datatype_to_string a.ft2)

