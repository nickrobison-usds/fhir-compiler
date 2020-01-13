open! Core

exception ParseException of string

let read file parser =
  let open Rresult.R.Infix in
  Bos.OS.File.read file >>= fun buf ->
  let j = Yojson.Safe.from_string buf in
  match (parser j)
  with
  | Ok s -> Result.Ok s
  | Error e -> Result.Error (`Msg e)
