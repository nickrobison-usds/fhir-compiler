open! Base
open Alcotest

let datatypeTest = testable (fun f t -> Fmt.pf f "%s" (Lib.Datatype.datatype_to_string t)) (fun l r -> String.equal (Lib.Datatype.datatype_to_string l) (Lib.Datatype.datatype_to_string r))

let simple = Stu3.Structure.STU3_Parser.create "Account" "Simple"[Lib.Element.create "Elem.first" 0 "1" ["string"]]

let simple_field: type a. a Lib.Fhir.field -> unit =
  fun field ->
  match field with
  | Field field ->
    match field.datatype with
    | Scalar s -> begin
        Alcotest.check datatypeTest "Should be a string" Lib.Datatype.String s.scalar_type;
        Alcotest.(check bool) "Should not be required" false s.required
      end
    | _ -> Alcotest.fail "Must be a scalar"

let arity = Stu3.Structure.STU3_Parser.create "Account" "Arity" [Lib.Element.create "Elem.first" 1 "*" ["integer"]]

let arity_field: type a. a Lib.Fhir.field -> unit =
fun field ->
match field with
| Field field ->
match field.datatype with
| Arity a -> begin
        Alcotest.check datatypeTest "Should be an integer" Lib.Datatype.Integer a.ft2;

end

| _ -> Alcotest.fail "Must be an arity"


let simple_test () =
  let open Stu3.Structure.STU3_Parser in
  let f = to_resource simple in
  Alcotest.(check int) "Should have a single element" 1 (List.length f.fields);
  Alcotest.(check string) "Should have the correct name" "Simple" f.name;
  let field = List.hd_exn f.fields in
  simple_field field

let arity_test () =
let open Stu3.Structure.STU3_Parser in
let f = to_resource arity in
Alcotest.(check int) "Should have a single element" 1 (List.length f.fields);
  Alcotest.(check string) "Should have the correct name" "Arity" f.name;
let field = List.hd_exn f.fields in
arity_field field


let test =
  "Resource Building Tests", [
    Alcotest.test_case "Simple Resource" `Quick simple_test;
Alcotest.test_case "Resource with arity" `Quick arity_test
  ]
