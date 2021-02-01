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

let patient_arity_opt () =
  Lib.Resource.make "Patient" [
    Lib.Fhir.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = Lib.Datatype.String;
          required = true;
        }
    };
    Lib.Fhir.Field {
      path = Lib.Path.from_string "Patient.Id";
      id = "Patient.Id";
      datatype = Lib.Fhir.Arity {
          l3 = "id";
          min = 0;
          max = "*";
          ft2 = Lib.Datatype.ID;
        }
    }
  ]

let patient_arity_req () =
  Lib.Resource.make "Patient" [
    Lib.Fhir.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = Lib.Datatype.String;
          required = true;
        }
    };
    Lib.Fhir.Field {
      path = Lib.Path.from_string "Patient.Id";
      id = "Patient.Id";
      datatype = Lib.Fhir.Arity {
          l3 = "id";
          min = 1;
          max = "*";
          ft2 = Lib.Datatype.ID;
        }
    }
  ]


let v () =
  let table = Hashtbl.create (module String) in
  Hashtbl.set table ~key:"patient_optional" ~data:(patient_opt ());
  Hashtbl.set table ~key:"patient_required" ~data:(patient_reqed ());
  Hashtbl.set table ~key:"patient_arity_optional" ~data:(patient_arity_opt
                                                           ());
  Hashtbl.set table ~key:"patient_arity_required" ~data:(patient_arity_req ());
  table
