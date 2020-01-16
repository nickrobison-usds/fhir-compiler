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
  let _names = ["Hello"; "from"; "print"] in
  let s = Fmt.list ~sep:Fmt.comma Element.emit in
  let s = Fmt.vbox (Fmt.braces s) in
  Fmt.pf fmt "open class %s: Resource %a\n" t.name s t.fields
