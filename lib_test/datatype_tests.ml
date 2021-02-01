open! Base

module D = Lib.Datatype


let test_string_conv () =
  Alcotest.check_raises "Unknown datatype" (Lib.Exceptions.UnsupportedType "nothing") (fun () -> let _ = Lib.Datatype.t_of_string "nothing" in ())

let test_string_round_trip () =
  let code = "base64Binary" in
  Alcotest.(check string) "Should have correct primitive roundrip" code (D.t_to_string (D.t_of_string code));
  let code = "Ratio" in
  Alcotest.(check string) "Should have correct complex roundrip" code (D.t_to_string (D.t_of_string code))


let v =
  let open Alcotest in
  "Datatype Tests", [
    test_case "String conversion exception" `Quick test_string_conv;
    test_case "Round trip string conversion" `Quick test_string_round_trip;
  ]
