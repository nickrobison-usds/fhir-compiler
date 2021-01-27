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

let is_parent lhs rhs =
  (* If they are the same length (or left is longer), then they can't be parent/child*)
  if ((length lhs) >= (length rhs)) then false else
    let len = length lhs in
    let rhs' = List.sub rhs ~pos:0 ~len in
    List.fold2_exn lhs rhs' ~init:true ~f:(fun acc l r -> acc && (String.equal l r))
