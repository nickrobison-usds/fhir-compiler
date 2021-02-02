open! Base

let test_primitives () =
  Alcotest.(check bool) "`Code` is primitive" true (Lib.Element.is_primitive_or_class "code");
  Alcotest.(check bool) "`CodeableConcept` is a class" true (Lib.Element.is_primitive_or_class "CodeableConcept");
  Alcotest.(check bool) "`Patient` is a class" true (Lib.Element.is_primitive_or_class "http://hl7.org/fhir/Patient");
  Alcotest.(check bool) "`BackboneElement` is not a class" false (Lib.Element.is_primitive_or_class "BackboneElement")

let element_tests =
  let open Alcotest in
  "Element Tests", [
    test_case "Primtive Tests" `Quick test_primitives;
  ]
