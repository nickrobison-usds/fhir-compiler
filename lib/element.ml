open! Base

exception JsonConversionException of string

let src = Logs.Src.create "fhirc.compiler.element" ~doc: "Element processing"

module Log = (val Logs.src_log src : Logs.LOG)

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

let create name min max typs =
  let typs = List.map typs ~f:(fun typ -> {
      code = typ;
      profile = None;
      aggregation = [];
      versioning = None;
      targetProfile = None;
    }) in
  {
    path = name;
    id = name;
    short_description = None;
    typ = typs;
    min;
    max
  }

let reg = Re.Posix.compile_pat "^([A-Za-z]+\\.)+"

let primitive = Re.Posix.compile_pat "^[a-z][A-Za-z]+$"

let replace_leading s =
  Re.replace_string reg ~by:"" s

let is_primitive s =
  not (List.is_empty (Re.matches primitive s))

let emit_scalar t code =
  Log.debug (fun f -> f "Emitting single max: %s" t.max);
  Fhir.Scalar {
    scalar_type = Fhir.datatype_of_string code;
    required = Int.(>=) 1 t.min;
  }

let emit_arity t code =
  Log.debug (fun f -> f "Emitting arity: min: %d max: %s" t.min t.max);
  Fhir.Arity {
    l3 = replace_leading t.id;
    min = t.min;
    max = t.max;
    ft2 = Fhir.datatype_of_string code;
  }

let emit_complex t code =
  Fhir.Complex {
    l = replace_leading t.path;
    typ = code;
  }

let emit_single t code =
  match is_primitive code with
  | true ->
    Log.debug (fun f -> f "Emitting primitive");
    (match t.max with
     | "1" -> emit_scalar t code
     | _ -> emit_arity t code)
  | false ->
    Log.debug (fun f -> f "Emitting complex");
    (* Fix this, we need to get the datatype*)
    emit_complex t Fhir.Code

let emit_union t typs =
  let l = List.map ~f:(fun f -> f.code) typs in
  Fhir.Union {
    field_types = List.map ~f:(fun c -> emit_single t c) l;
    l2 = replace_leading t.id;
  }

let to_field t =
  Log.debug (fun f -> f "Converting element: %a" pp t);
  let dt = match t.typ with
    | [] -> None
    | [x] ->  Some (emit_single t x.code)
    | x -> Some (emit_union t x)
  in
  match dt with
  | None -> None
  | Some dt -> Some (Fhir.Field {
      id = t.id;
      path = Path.from_string t.path;
      datatype = dt})
