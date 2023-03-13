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
  if List.length args <> 2 then
    raise (Invalid_argument "Missing command line arguments")
  else
    let f = List.nth_exn args 1 in
    let resource = read (dir f) P.to_fhir in
    match resource with
    | Rresult.Ok r ->
        let sexp = Lib.Resource.sexp_of_t sexpit r in
        Sexp.pp_hum Fmt.stdout sexp
    | Rresult.Error e -> ( match e with `Msg m -> raise (Invalid_argument m))
