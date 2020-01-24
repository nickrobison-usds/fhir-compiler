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
