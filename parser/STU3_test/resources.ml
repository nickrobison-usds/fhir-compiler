open! Base
open Alcotest

let datatypeTest = testable (fun f t -> Fmt.pf f "%s" (Lib.Fhir.datatype_to_string t)) (fun l r -> String.equal (Lib.Fhir.datatype_to_string l) (Lib.Fhir.datatype_to_string r))

let simple = Stu3.Structure.STU3_Parser.create "Account" "Simple"[Lib.Element.create "Elem.first" 0 "1" ["string"]]

let simple_field: type a. a Lib.Fhir.field -> unit =
  fun field ->
  match field with
  | Field field ->
    match field.datatype with
    | Scalar s -> begin
        Alcotest.check datatypeTest "Should be a string" Lib.Fhir.String s.scalar_type;
        Alcotest.(check bool) "Should not be required" false s.required
      end
    | _ -> Alcotest.fail "Must be a scalar"

let simple_test () =
  let open Stu3.Structure.STU3_Parser in
  let f = to_resource simple in
  Alcotest.(check int) "Should have a single element" 1 (List.length f.fields);
  Alcotest.(check string) "Should have the correct name" "Simple" f.name;
  let field = List.hd_exn f.fields in
  simple_field field

let test =
  "Resource Building Tests", [
    Alcotest.test_case "Simple Resource" `Quick simple_test
  ]
