open! Base

type 'a t = {
  name: string;
  fields: 'a Fhir.field list
} [@@deriving sexp_of]

let make name fields =
  {
    name = name;
    fields = fields;
  }

let field_by_name t name =
  List.find t.fields ~f:(fun field ->
      match field with
      | Fhir.Field field -> String.equal field.id name)

let t_of_complex: type a. a Fhir.fhir_datatype -> a t =
  fun dtype ->
  match dtype with
  | Complex c -> make c.name c.fields
  | _ -> raise (Invalid_argument "Cannot pass non-complex to this function")
