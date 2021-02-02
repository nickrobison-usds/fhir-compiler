open! Base

module P = Stu3.STU3_Parser.P
module S = Stu3.Structure
module F = Lib.Fhir

exception ParseException of string

let dir f = Fpath.(v "../../resources" / f)

let read file parser =
  let open Rresult.R.Infix in
  Bos.OS.File.read file >>= fun buf ->
  let j = Yojson.Safe.from_string buf in
  Result.Ok (parser j)

let sexpit _a =
  Parsexp.Single.parse_string_exn "I'm a test, and should never be called"

let () =
  let args = Array.to_list (Sys.get_argv ()) in
  if (List.length args) <> 2 then
    raise (Invalid_argument "Missing command line arguments")
  else
    let f = List.nth_exn args 1 in
    let resource = read (dir f) S.t_of_yojson in
    match resource with
    | Rresult.Ok s ->
      let r = P.to_resource s in
      let sexp = Lib.Resource.sexp_of_t sexpit r in
      Sexp.pp_hum Fmt.stdout sexp;
      Stdio.print_endline "hello"
    | _ -> raise (Invalid_argument "Cannot parse file")
