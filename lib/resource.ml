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

let emit fmt _t =
  let names = ["Hello"; "from"; "print"] in
  let s = Fmt.list ~sep:Fmt.comma Fmt.string in
  let s = Fmt.vbox (Fmt.braces s) in
  Fmt.pf fmt "open class %s: StructureDefinition%a\n" "hello" s names
