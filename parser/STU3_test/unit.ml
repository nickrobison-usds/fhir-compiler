open! Base
open Alcotest
exception ParseError of string


let structTest = testable Stu3.Structure.STU3_Parser.pp Stu3.Structure.STU3_Parser.equal

let test_case typ typ_str v = check typ typ_str v v

let dir f = Fpath.(v "resources" / f)

let unwrap_msg = function
  | `Msg m -> m
  | _ -> ""

type error = [`Msg of string]
let pp_error ppf (`Msg x) = Fmt.string ppf x
let error = Alcotest.testable pp_error (fun a b -> String.(=) (unwrap_msg a) (unwrap_msg b))
let t = Alcotest.(result structTest error)

let test_patient_parse () =
  let f = (dir "patient-stu3.json") in
  let name = Fpath.to_string f in
  let patient = Reader.read f Stu3.Structure.STU3_Parser.t_of_yojson in
  (* Test that it is a structure definition*)
  test_case t name patient;
  let patient = match patient with
    | Ok p -> p
    | Error e -> fail (unwrap_msg e)
  in
  Alcotest.(check int) "Should have elements" 52 (List.length (Stu3.Structure.STU3_Parser.elements patient));
  ()


let test_account_parse () =
  let f = (dir "account-stu3.json") in
  let name = Fpath.to_string f in
  let account = Reader.read f Stu3.Structure.STU3_Parser.t_of_yojson in
  test_case t name account;
  let account = match account with
    | Ok a -> a
    | Error e -> fail (unwrap_msg e)
  in
  Alcotest.(check int) "Should have elements" 32 (List.length (Stu3.Structure.STU3_Parser.elements account));
  ()

let () =
  run "STU3 Parser Tests" [
    "Resource Parsing Tests",
    [
      Alcotest.test_case "Patient Resource" `Quick test_patient_parse;
      Alcotest.test_case "Account Resource" `Quick test_account_parse;
    ];
    Resources.test
  ]
