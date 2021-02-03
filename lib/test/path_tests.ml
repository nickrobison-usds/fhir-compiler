open! Base
open Lib

let test_create () =
  let str =  "Patient.Contact.Relationship" in
  let p = Path.from_string str in
  Alcotest.(check int) "Should have the correct length" 3 (Path.length p);
  Alcotest.(check string) "Should convert back ok" str (Path.to_string p)

let parent_tests () =
  let c1 = Path.from_string "Patient.Contact" in
  Alcotest.(check bool) "Should not be parents" false (Path.is_parent c1 c1);
  Alcotest.(check bool) "Should be parent" true (Path.is_parent c1 (Path.from_string "Patient.Contact.Address"));
  Alcotest.(check bool) "Should not be parent" false (Path.is_parent (Path.from_string "Patient.Name") (Path.from_string "Patient.Contact.Address"));
  Alcotest.(check bool) "Should not be parent" false (Path.is_parent c1 (Path.from_string "Patient"))

let v =
  let open Alcotest in
  "Path Tests", [
    test_case "Creation Tests" `Quick test_create;
    test_case "Parent Tests" `Quick parent_tests;
  ]
