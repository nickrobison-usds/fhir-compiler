open! Base

let src = Logs.Src.create "fhirc.backend.swift.class" ~doc:"Swift backend class emitter"

module Log = (val Logs.src_log src : Logs.LOG)

type t = {
  name: string;
  is_open: bool;
  parent: t option list;
  fields: Swift_field.t list;
  constructor: Swift_field.t list;
  (* Eventually, these should be unified into an Emittable signature *)
  nested_classes: t list;
  nested_enums: Sum.t list;
}

let make_nested_class_name t name =
  Printf.sprintf "%s%s" t.name (String.capitalize name)

let name t = t.name

let rec add_field: type a. t -> Lib.Path.t -> a Lib.Fhir.field -> t =
  fun t _path field ->
  match field with
  | Field field ->
    match field.datatype with
    | Scalar f -> begin
        let value = Swift_field.create (Lib.Path.trailing field.path) false f.scalar_type f.required
        in
        if f.required then
          {t with constructor = value :: t.constructor; fields = value :: t.fields}
        else
          {t with fields = value :: t.fields}
      end
    | Union u ->
      let sum_name = t.name ^ (String.capitalize u.l2) in
      let options = List.map u.field_types ~f:Sum.Option.t_of_datatype in
      let s = Sum.create sum_name options in
      let value = Swift_field.create u.l2 false (Lib.Datatype.Domain sum_name) false
      in
      {t with fields = value :: t.fields; nested_enums = s :: t.nested_enums}
    | Arity f ->
      let required = if (f.min) >= 1 then true else false in
      let value = Swift_field.create f.l3 true f.ft2 required
      in
      if required then
        {t with constructor = value :: t.constructor; fields = value :: t.fields}
      else
        {t with fields = value :: t.fields}
    | Complex c ->
      let nested_name = make_nested_class_name t c.name in
      let value = Swift_field.create c.name false (Lib.Datatype.Domain nested_name) false
      in
      {t with fields = value :: t.fields; nested_classes = (create (
           Lib.Structure.make nested_name c.fields
         )) :: t.nested_classes}
and create: type a. a Lib.Structure.t -> t =
  fun res ->
  let path = Lib.Path.from_string res.name in
  let empty = {name = res.name; is_open = false; parent = []; fields = []; constructor = []; nested_classes = []; nested_enums = []}
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

(* Emit class [t] as a string, along with any nested classes and enums.
   This will be written as a single Swift file *)
let emit_class t =
  let lst = List.append [t] t.nested_classes in
  let init = Fmt.str "%a" Prelude.emit() in
  let classes = List.fold lst ~init ~f:(fun acc c ->
      let class_str = Fmt.str "%a class %s %a"
          emit_open c
          c.name
          (Fmt.braces emit_class_body) c
      in
      Fmt.str "%s\n\n%s" acc class_str
    ) in
  List.fold t.nested_enums ~init:classes ~f:(fun acc c ->
      let class_str = Fmt.str "%a" Sum.pp c in
      Fmt.str "%s\n\n%s" acc class_str
    )

let emit oc t =
  Stdio.Out_channel.output_string oc (emit_class t)
