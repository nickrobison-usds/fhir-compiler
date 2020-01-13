open! Core


type t = {
  path: string;
  id: string;
  short_description: string option [@key "short"];
} [@@deriving yojson {strict = false}, show, eq]

let create hello =
  {path = hello; id = hello; short_description = (Some hello)}
