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
          let value = Swift_field.create f.l3 true f.ft2 false
          in
          {t with fields = value :: t.fields}
        | Complex c ->
          let value = Swift_field.create c.l false c.typ false
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

let emit_open fmt t =
  Fmt.pf fmt "%s" ( if t.is_open then "open" else "")

let emit_class_name t =
  Fmt.str "%a class %s" emit_open t t.name

let write_to_file t =
  fun oc ->
  Stdio.Out_channel.output_string oc (emit_class_name t)

let emit path t =
  let path = Fpath.add_seg path  (Fmt.str "%s.swift" t.name) in
  Stdio.printf "Writing to %s\n" (Fpath.to_string path);
  let write_to_file = write_to_file t in
  Stdio.Out_channel.with_file (Fpath.to_string path) ~f:write_to_file
