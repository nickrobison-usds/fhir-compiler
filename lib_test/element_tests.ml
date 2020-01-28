open! Base
open Alcotest

let test_primitives () =
  Alcotest.(check bool) "`Code` is primitive" true (Lib.Element.is_primitive "code");
  Alcotest.(check bool) "`CodeableConcept` not primitive" false (Lib.Element.is_primitive "CodeableConcept");
  Alcotest.(check bool) "`Patient` is not primitive`" false (Lib.Element.is_primitive "http://hl7.org/fhir/Patient")

let element_tests =
  "Element Tests", [
    test_case "Primtive Tests" `Quick test_primitives;
  ]
