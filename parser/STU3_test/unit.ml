open! Base
open Alcotest

exception ParseError of string

let structTest = testable Stu3.Structure.pp Stu3.Structure.equal

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
  let patient = Reader.read f Stu3.Structure.t_of_yojson in
  (* Test that it is a structure definition*)
  test_case t name patient;
  let _p = match patient with
    | Ok p -> p
    | Error e -> fail (unwrap_msg e)
  in
  ()

let () =
  run "STU3 Parser Tests" [
    "Resource Parsing Tests",
    [
      Alcotest.test_case "Patient Resource" `Quick test_patient_parse;
    ];
  ]
