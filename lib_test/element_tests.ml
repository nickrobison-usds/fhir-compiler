open! Base

let test_primitives () =
  Alcotest.(check bool) "`Code` is primitive" true (Lib.Element.is_primitive "code");
  Alcotest.(check bool) "`CodeableConcept` not primitive" false (Lib.Element.is_primitive "CodeableConcept");
  Alcotest.(check bool) "`Patient` is not primitive`" false (Lib.Element.is_primitive "http://hl7.org/fhir/Patient")

let element_tests =
  let open Alcotest in
  "Element Tests", [
    test_case "Primtive Tests" `Quick test_primitives;
  ]
