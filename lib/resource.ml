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

let surround p1 p2 pp_v fmt v =
  Fmt.pf fmt "%a%a%a" p1 () pp_v v p2 ()

let emit fmt t =
  let _names = ["Hello"; "from"; "print"] in
  let sep = Fmt.comma in
  let s = Fmt.list ~sep Element.emit in
  let s = Fmt.vbox (Fmt.braces (surround Fmt.cut Fmt.cut s)) in
  Fmt.pf fmt "open class %s: Resource %a\n" t.name s t.fields
