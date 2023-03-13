let unit_test () = Alcotest.(check string) "Should match" "hello" "hello"

let () =
  let open Alcotest in
  run "Swift Backend Tests"
    [ ("Unit tests", [ test_case "Unit test" `Quick unit_test ]) ]
