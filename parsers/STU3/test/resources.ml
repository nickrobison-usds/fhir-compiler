open! Base
open Alcotest

module S = Stu3.Structure.STU3_Parser

let datatypeTest = testable (fun f t -> Fmt.pf f "%s" (Lib.Datatype.t_to_string t)) (fun l r -> String.equal (Lib.Datatype.t_to_string l) (Lib.Datatype.t_to_string r))

let simple = S.create "Account" "Simple"[Lib.Element.create "Elem.first" 0 "1" ["string"]]

let simple_field: type a. a Lib.Fhir.field -> unit =
  fun field ->
  match field with
  | Field field ->
    match field.datatype with
    | Scalar s -> begin
        Alcotest.check datatypeTest "Should be a string" (Lib.Datatype.Simple (Lib.Simple_datatype.String)) s.scalar_type;
        Alcotest.(check bool) "Should not be required" false s.required
      end
    | _ -> Alcotest.fail "Must be a scalar"

let arity = S.create "Account" "Arity" [Lib.Element.create "Elem.first" 1 "*" ["integer"]]

let arity_field: type a. a Lib.Fhir.field -> unit =
fun field ->
match field with
| Field field ->
match field.datatype with
| Arity a -> begin
        Alcotest.check datatypeTest "Should be an integer" (Lib.Datatype.Simple (Lib.Simple_datatype.Integer)) a.ft2;

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


let complex = S.create "Patient" "ComplexTest" [
    Lib.Element.create "Patient.name" 0 "1" ["string"];
    Lib.Element.create "Patient.contact" 0 "1" ["BackboneElement"];
    Lib.Element.create "Patient.contact.id" 0 "1" ["string"];
  ]

let complex_test () =
  let open S in
  let f = to_resource complex in
  Alcotest.(check int) "Should have correct elements" 2 (List.length f.fields);
  let c = List.find_exn f.fields ~f:(fun field ->
      match field with
      | Lib.Fhir.Field field ->
        Stdio.print_endline (Printf.sprintf "Have field: %s" field.id);
        (String.equal field.id "Patient.contact")) in
  Alcotest.(check bool) "Should be complex" true (match c with
      | Lib.Fhir.Field c -> match c.datatype with
        | Lib.Fhir.Complex _ -> true
        | _ -> false);
(* Let's see how many types we have in our complex*)
  Alcotest.(check int) "Should have a nested type" 1 (
    match c with
    | Field c ->
      match c.datatype with
        | Lib.Fhir.Complex c -> List.length c.components
        | _ -> Alcotest.fail "Must be complex")
let test =
  "Resource Building Tests", [
    Alcotest.test_case "Simple Resource" `Quick simple_test;
    Alcotest.test_case "Resource with arity" `Quick arity_test;
    Alcotest.test_case "Resource with complex" `Quick complex_test;
  ]
