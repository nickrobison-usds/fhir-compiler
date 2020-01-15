open! Base

type t = {
  name: string;
  fields: Fhir.packed list
}

let make name fields =
  {
    name = name;
    fields = fields;
  }

let emit fmt t =
  Fmt.pf fmt "%s\n" t.name
