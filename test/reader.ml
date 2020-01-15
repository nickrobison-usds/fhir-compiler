open! Base

exception ParseException of string

let read file parser =
  let open Rresult.R.Infix in
  Bos.OS.File.read file >>= fun buf ->
  let j = Yojson.Safe.from_string buf in
  Result.Ok (parser j)
