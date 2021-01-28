open! Base

let emit fmt () =
  Fmt.pf fmt "import Foundation\n"
