open! Base
open Alcotest

exception ParseError of string

let () =
  run "Unit Tests"
    [ Element_tests.element_tests; Path_tests.v; Datatype_tests.v ]
