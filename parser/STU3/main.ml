open! Base

let () =
  Stdio.print_endline "Registering STU3 parser";
  Lib.Parser.register (module Structure.STU3_Parser) "STU3"
