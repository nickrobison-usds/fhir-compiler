open! Base

let patient_opt () =
  Lib.Resource.make "Patient" [
    Lib.Fhir.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = Lib.Datatype.String;
          required = false;
        }
    };
  ]

let patient_reqed () =
  Lib.Resource.make "Patient" [
    Lib.Fhir.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = Lib.Datatype.String;
          required = true;
        }
    };
  ]


let v () =
  let table = Hashtbl.create (module String) in
  Hashtbl.set table ~key:"patient_optional" ~data:(patient_opt ());
  Hashtbl.set table ~key:"patient_required" ~data:(patient_reqed ());
  table
