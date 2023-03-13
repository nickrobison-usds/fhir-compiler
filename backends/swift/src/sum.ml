open! Base

module Option = struct
  type t = { name : string; typ : string }

  let create name typ = { name; typ }
  let pp fmt t = Fmt.pf fmt "case %s(%s)" t.name t.typ

  let t_of_datatype dt =
    match dt with
    | Lib.Fhir.Scalar s ->
        let name = Swift_field.datatype_to_string s.scalar_type in
        { name = String.uncapitalize name; typ = name }
    | Lib.Fhir.Union u -> { name = u.l2; typ = u.l2 }
    | Lib.Fhir.Arity a ->
        let typ = Swift_field.datatype_to_string a.ft2 in
        let name = String.uncapitalize a.l3 in
        { name; typ }
    | Lib.Fhir.Complex c -> { name = c.name; typ = c.name }
end

type t = { name : string; options : Option.t list }

let create name options = { name; options }
let t_of_union union = { name = union; options = [] }

let pp_cases fmt t =
  let lst = Fmt.list ~sep:Formatters.case_sep Option.pp in
  Fmt.pf fmt "@\n%a@\n" lst t.options

let pp fmt t = Fmt.pf fmt "public enum %s %a" t.name (Fmt.braces pp_cases) t
