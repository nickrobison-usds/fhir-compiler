open! Base

let sep = '.'

type t = string list [@@deriving eq]

let from_string s =
  String.split s ~on:sep

let to_string t =
  String.concat ~sep:"." t

let length t =
  List.length t

let leading t =
  List.hd_exn t

let trailing t =
  List.last_exn t
