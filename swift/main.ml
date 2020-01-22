open! Base
open Lib

type 'a t = {
  name: string;
  fields: 'a Fhir.field_ list
}

let name () = "Swift"

let make name fields =
  {
    name = name;
    fields = fields;
  }
let surround p1 p2 pp_v fmt v =
  Fmt.pf fmt "%a%a%a" p1 () pp_v v p2 ()

let emit: type a. Formatter.t -> a Lib.Resource.t -> unit =
  fun fmt t ->
  let sep = Fmt.comma in
  let s = Fmt.list ~sep Element.emit in
  let s = Fmt.vbox (Fmt.braces (surround Fmt.cut Fmt.cut s)) in
  Fmt.pf fmt "open class %s %a\n" t.name s t.fields

let commands =
  let open Cmdliner in
  Term.(ret (const (fun _ -> `Help (`Pager, None)) $ const ())),
  Term.info "swift"
