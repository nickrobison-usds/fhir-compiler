open! Base

let src = Logs.Src.create "fhirc.backends.swift.enum" ~doc:"Swift backend enum emitter"

module Log = (val Logs.src_log src: Logs.LOG)

type t = {
  name: string;
  cases: string list;
}

let from_code (c: Lib.Codesystem.code) =
  c.code


let create (cs: 'a Lib.Codesystem.t) = {
  name = cs.name;
  cases = List.map cs.concept ~f:from_code;
}

let name t = t.name

let pp_case fmt str =
  Fmt.pf fmt "case %s = \"%s\"" (String.uncapitalize str) str

let case_sep fmt () =
  Fmt.pf fmt "@\n@\n"

let pp_enum_options fmt t =
  let cases = Fmt.list ~sep:case_sep pp_case in
  Fmt.pf fmt "@\n%a@\n" cases t.cases

let pp_enum_surround fmt t =
  Fmt.pf fmt "public enum %s %a" t.name (Fmt.braces (pp_enum_options)) t

let pp fmt t =
  Fmt.pf fmt "%a" pp_enum_surround t

let emit oc t =
  let str = Fmt.str "%a" pp t in
  Stdio.Out_channel.output_string oc str
