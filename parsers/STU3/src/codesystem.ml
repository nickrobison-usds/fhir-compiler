open! Base

type concept = {
  code : string;
  display : string option; [@default None]
  definition : string option; [@default None]
}
[@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

type t = {
  id : string;
  name : string;
  description : string;
  valueSet : string option; [@default None]
  content : string;
  concept : concept list;
}
[@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

let make_code : concept -> Lib.Codesystem.code =
 fun c -> { code = c.code; display = c.display; description = c.definition }

let to_codesystem t =
  let ct =
    match t.content with
    | "complete" -> Lib.Codesystem.Complete
    | "open" -> Lib.Codesystem.Open
    | "example" -> Lib.Codesystem.Example
    | "fragment" -> Lib.Codesystem.Fragment
    | "not-present" -> Lib.Codesystem.NotPresent
    | s -> raise (Invalid_argument s)
  in
  let codes = List.map t.concept ~f:make_code in
  Lib.Codesystem.make ~name:t.name ~valueset:t.valueSet
    ~description:t.description ct codes

let typ = "CodeSystem"

let to_fhir json =
  let cs = t_of_yojson json |> to_codesystem in
  Lib.Resource.CodeSystem cs
