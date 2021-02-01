open! Base

module F = Lib.Fhir
module D = Lib.Datatype
module P = Lib.Simple_datatype
module C = Lib.Complex_datatype

let patient_opt () =
  Lib.Resource.make "Patient" [
    F.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = D.Simple P.String;
          required = false;
        }
    };
  ]

let patient_reqed () =
  Lib.Resource.make "Patient" [
    F.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = D.Simple P.String;
          required = true;
        }
    };
  ]

let patient_arity_opt () =
  Lib.Resource.make "Patient" [
    F.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = D.Simple P.String;
          required = true;
        }
    };
    F.Field {
      path = Lib.Path.from_string "Patient.Id";
      id = "Patient.Id";
      datatype = Lib.Fhir.Arity {
          l3 = "id";
          min = 0;
          max = "*";
          ft2 = D.Simple P.ID;
        }
    }
  ]

let patient_arity_req () =
  Lib.Resource.make "Patient" [
    F.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = D.Simple P.String;
          required = true;
        }
    };
    F.Field {
      path = Lib.Path.from_string "Patient.Id";
      id = "Patient.Id";
      datatype = Lib.Fhir.Arity {
          l3 = "id";
          min = 1;
          max = "*";
          ft2 = D.Simple P.ID;
        }
    }
  ]

let pth_str = Lib.Path.from_string

let account () =
  Lib.Resource.make "Account" [
    F.Field {
      path = Lib.Path.from_string "Account.Identifier";
      id = "Account.Identifier";
      datatype = Lib.Fhir.Arity {
          l3 = "Identifier";
          min = 0;
          max = "*";
          ft2 = D.Simple P.ID;
        }
    };
    F.Field {
      path = pth_str "Account.Status";
      id = "Account.Identifier";
      datatype = Lib.Fhir.Scalar {
          scalar_type = D.Simple P.Code;
          required = false;
        }
    };
    F.Field {
      path = pth_str "Account.Type";
      id = "Account.Type";
      datatype = F.Scalar {
          scalar_type = D.Complex C.CodeableConcept;
          required = false;
        }
    };
    F.Field {
      path = pth_str "Account.Name";
      id = "Account.Name";
      datatype = F.Scalar {
          scalar_type = D.Simple P.String;
          required = false
        }
    };
    (* TODO: Subject here *)
    F.Field {
      path = pth_str "Account.Period";
      id = "Account.Period";
      datatype = F.Scalar {
          scalar_type = D.Complex C.Period;
          required = false;
        }
    };
    F.Field {
      path = pth_str "Account.Active";
      id = "Account.Active";
      datatype = F.Scalar {
          scalar_type = D.Complex C.Period;
          required = false;
        }
    };
    F.Field {
      path = pth_str "Account.Balance";
      id = "Account.Balance";
      datatype = F.Scalar {
          scalar_type = D.Complex C.Money;
          required = false;
        }
    };
    (* TODO: Coverage here *)
    (* TODO: Owner here *)
    F.Field {
      path = pth_str "Account.Description";
      id = "Account.Description";
      datatype = F.Scalar {
          scalar_type = D.Simple P.String;
          required = false;
        }
    };
    (* TODO: Guarantor here *)
  ]


let v () =
  let table = Hashtbl.create (module String) in
  Hashtbl.set table ~key:"patient_optional" ~data:(patient_opt ());
  Hashtbl.set table ~key:"patient_required" ~data:(patient_reqed ());
  Hashtbl.set table ~key:"patient_arity_optional" ~data:(patient_arity_opt
                                                           ());
  Hashtbl.set table ~key:"patient_arity_required" ~data:(patient_arity_req ());
  Hashtbl.set table ~key:"account" ~data:(account ());
  table
