open! Core
open Alcotest

exception ParseError of string

let structTest = testable Lib.Structure.pp Lib.Structure.equal

let test_case typ typ_str v = check typ typ_str v v

let file = "patient-stu3.json"
let dir f = Fpath.(v "resources" / f)

let unwrap_msg = function
  | `Msg m -> m
  | _ -> ""

type error = [`Msg of string]
let pp_error ppf (`Msg x) = Fmt.string ppf x
let error = Alcotest.testable pp_error (fun a b -> String.(=) (unwrap_msg a) (unwrap_msg b))
let t = Alcotest.(result structTest error)

let test_patient_parse () =
  let f = (dir file) in
  let name = Fpath.to_string f in
  let patient = Reader.read f Lib.Structure.t_of_yojson in
  (* Test that it is a structure definition*)
  test_case t name patient;
  let p = match patient with
    | Ok p -> p
    | Error e -> fail (unwrap_msg e)
  in
 (* Verify simple field generation*)
let obj = Lib.Structure.to_fhir p in
  Alcotest.(check int) "Should have identical number of fields" 51 (List.length (Lib.Fhir.Resource.fields obj))


let test_ok () =
  Alcotest.(check string) "same string" "hello" "hello"

let () =
  let open Alcotest in
  run "Unit Tests" [
    "Simple",
    [
      test_case "Always pass" `Quick test_ok;
    ];
    "Parsing",
    [
      test_case "Patient Resource" `Quick test_patient_parse;
    ]
  ]
