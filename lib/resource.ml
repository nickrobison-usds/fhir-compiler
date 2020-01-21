open! Base

type 'a t = {
  name: string;
  fields: 'a Fhir.field_ list
}

let make name fields =
  {
    name = name;
    fields = fields;
  }
