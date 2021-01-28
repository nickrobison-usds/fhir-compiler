open! Base

type 'a t = {
  name: string;
  fields: 'a Fhir.field list
}

let make name fields =
  {
    name = name;
    fields = fields;
  }

let field_by_name t name =
  List.find t.fields ~f:(fun field ->
      match field with
      | Fhir.Field field -> String.equal field.id name)
