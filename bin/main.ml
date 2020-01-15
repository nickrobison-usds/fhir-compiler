open! Base
open Lib

exception ParseError of string

let file = "patient-stu3.json"

let parse_definition ic =
  let json = Yojson.Safe.from_channel ic in
  let s = Structure.of_yojson json in
  match s with
  | Ok s -> s
  | Error e -> raise (ParseError e)

let () =
  let ic = In_channel.create file in
  ( try
      let def = parse_definition ic in
      print_endline( "Parsed: " ^ Structure.typ def);
      In_channel.close ic
    with e ->
      In_channel.close ic;
      raise e);
  print_endline "Hello, World!"
