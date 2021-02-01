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
  | SimpleQuantity
  | Duration
  | Count
  | Money
  | CodeableConcept
  | Signature
  | Coding
  | Timing
  | Reference [@@deriving sexp]

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
  | "SimpleQuantity" -> SimpleQuantity
  | "Duration" -> Duration
  | "Count" -> Count
  | "Money" -> Money
  | "CodeableConcept" -> Signature
  | "Signature" -> Signature
  | "Coding" -> Coding
  | "Timing" -> Timing
  | "Reference" -> Reference
  | s -> raise (Exceptions.UnsupportedType s)

let t_to_string = function
  | Ratio -> "Ratio"
  | Period -> "Period"
  | Money -> "Money"
  | CodeableConcept -> "CodeableConcept"
  | Reference -> "Reference"
  | _ -> raise (Exceptions.UnsupportedType "Cannot convert this complex type yet")
