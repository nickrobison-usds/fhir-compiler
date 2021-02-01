open! Base

let src = Logs.Src.create "fhirc.backend.swift.class" ~doc:"Swift backend class emitter"

module Log = (val Logs.src_log src : Logs.LOG)

type t = {
  name: string;
  is_open: bool;
  parent: t option list;
  fields: Swift_field.t list;
  constructor: Swift_field.t list;
}

let add_field: type a. t -> Lib.Path.t -> a Lib.Fhir.field -> t =
  fun t _path field ->
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
            let value = Swift_field.create (Lib.Path.trailing field.path) false f.scalar_type f.required
            in
            if f.required then
              {t with constructor = value :: t.constructor; fields = value :: t.fields}
            else
              {t with fields = value :: t.fields}
          end
        | Union _ -> t
        | Arity f ->
          let required = if (f.min) >= 1 then true else false in
          let value = Swift_field.create f.l3 true f.ft2 required
          in
          if required then
            {t with constructor = value :: t.constructor; fields = value :: t.fields}
          else
            {t with fields = value :: t.fields}
        | Complex c ->
          let value = Swift_field.create c.l false (Lib.Datatype.Simple (Lib.Simple_datatype.Code)) false
          in
          {t with fields = value :: t.fields}
      end

let create: type a. a Lib.Resource.t -> t =
  fun res ->
  let path = Lib.Path.from_string res.name in
  let empty = {name = res.name; is_open = false; parent = []; fields = []; constructor = []}
  in
  List.fold res.fields ~init:empty ~f:(fun acc f -> add_field acc path f)

(* Formatters *)

let emit_constructor_body fmt (f: Swift_field.t) =
  Fmt.pf fmt "self.%s=%s" f.name f.name

let emit_constructor fmt t =
  let args = Fmt.list ~sep:Fmt.comma Swift_field.emit_name_value_pair
  in
  let body_args = Fmt.list ~sep:Formatters.nline emit_constructor_body
  in
  Fmt.pf fmt "init %a{\n%a\n}"
    (Fmt.parens args) t.constructor
    body_args t.constructor

let emit_open fmt t =
  Fmt.pf fmt "%s" ( if t.is_open then "open" else "")

let emit_class_body fmt t =
  let fields = Fmt.list ~sep:Fmt.cut Swift_field.emit
  in
  Fmt.pf fmt "%a\n\n%a" fields t.fields emit_constructor t

let emit_class t =
  Fmt.str "%a %a class %s %a"
    Prelude.emit ()
    emit_open t
    t.name
    (Fmt.braces emit_class_body) t

let write_to_file t =
  fun oc ->
  Stdio.Out_channel.output_string oc (emit_class t)

let emit path t =
  let path = Fpath.add_seg path  (Fmt.str "%s.swift" t.name) in
  Stdio.printf "Writing to %s\n" (Fpath.to_string path);
  let write_to_file = write_to_file t in
  Stdio.Out_channel.with_file (Fpath.to_string path) ~f:write_to_file
