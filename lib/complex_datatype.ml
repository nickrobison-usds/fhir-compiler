open! Base

type t =
  | Ratio
  | Period
  | Range
  | Attachment
  | Identifier
  | HumanName
  | Annotation
  | Address
  | ContactPoint
  | SampledData
  | Quantity
  | CodeableConcept
  | Signature
  | Coding
  | Timing [@@deriving sexp]

let t_of_string = function
  | "Ratio" -> Ratio
  | "Period" -> Period
  | "Range" -> Range
  | "Attachment" -> Attachment
  | "Identifier" -> Identifier
  | "HumanName" -> HumanName
  | "Annotation" -> Annotation
  | "Address" -> Address
  | "ContactPoint" -> ContactPoint
  | "SampledData" -> SampledData
  | "Quantity" -> Quantity
  | "CodeableConcept" -> Signature
  | "Signature" -> Signature
  | "Coding" -> Coding
  | "Timing" -> Timing
  | s -> raise (Exceptions.UnsupportedType s)

let t_to_string = function
  | Ratio -> "Ratio"
  | Period -> "Period"
  | _ -> raise (Exceptions.UnsupportedType "Cannot convert this complex type yet")
