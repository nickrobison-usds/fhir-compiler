open! Base

type 'a record = { record_path : string; dtypes : 'a fhir_datatype list }

and ('a, 'b) field_ = {
  path : Path.t;
  id : string;
  datatype : 'a fhir_datatype;
}

and 'a field = Field : ('a, 'b) field_ -> 'a field [@@deriving sexp_of]

and 'a fhir_datatype =
  | Scalar : ('a, 'b) scalar -> 'a fhir_datatype
  | Union : ('a, 'b) union -> 'a fhir_datatype
  | Arity : ('a, 'b) arity -> 'a fhir_datatype
  | Complex : ('a, 'b) complex -> 'a fhir_datatype

and ('a, 'b) scalar = { scalar_type : Datatype.t; required : bool }
and ('a, 'b) arity = { l3 : string; min : int; max : string; ft2 : Datatype.t }
and ('a, 'b) union = { l2 : string; field_types : 'a fhir_datatype list }
and ('a, 'b) complex = { name : string; fields : 'a field list }

let append_fields r field = { r with fields = r.fields @ [ field ] }
