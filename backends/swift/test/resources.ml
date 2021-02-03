open! Base

module F = Lib.Fhir
module D = Lib.Datatype
module P = Lib.Simple_datatype
module C = Lib.Complex_datatype

let patient_opt () =
  Lib.Structure.make "Patient" [
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
  Lib.Structure.make "Patient" [
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
  Lib.Structure.make "Patient" [
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

let patient_union () =
  Lib.Structure.make "Patient" [
    F.Field {
      path = Lib.Path.from_string "Patient.Name";
      id = "Patient.Name";
      datatype = Lib.Fhir.Scalar {
          scalar_type = D.Simple P.String;
          required = true;
        }
    };
    F.Field {
      path = Lib.Path.from_string "Patient.deceased[x]";
      id = "Patient.deceased[x]";
      datatype = F.Union {
          l2 = "deceased";
          field_types = [
            F.Scalar {
              scalar_type = D.Simple P.Boolean;
              required = false;
            };
            F.Scalar {
              scalar_type = D.Simple P.DateTime;
              required = false;
            }
          ]
        }
    }
  ]


let patient_arity_req () =
  Lib.Structure.make "Patient" [
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
  Lib.Structure.make "Account" [
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
    F.Field {
      path = pth_str "Account.subject";
      id = "Account.subject";
      datatype = F.Scalar {
          scalar_type = D.Complex C.Reference;
          required = false;
        }
    };
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
    F.Field {
      path = pth_str "Account.Coverage";
      id = "Account.Coverage";
      datatype = F.Complex {
          name = "Coverage";
          fields = [
            F.Field {
              path = pth_str "Account.coverage.Coverage";
              id = "Account.coverage.Coverage";
              datatype = F.Scalar {
                  scalar_type = D.Complex C.Reference;
                  required = true;
                }
            };
            F.Field {
              path = pth_str "Account.Coverage.priority";
              id = "Account.Coverage.priority";
              datatype = F.Scalar {
                  scalar_type = D.Simple P.Integer;
                  required = false;
                }
            }
          ]
        }
    };
    F.Field {
      path = pth_str "Account.Owner";
      id = "Account.Owner";
      datatype = F.Scalar {
          scalar_type = D.Complex C.Reference;
          required = false;
        }
    };
    F.Field {
      path = pth_str "Account.Description";
      id = "Account.Description";
      datatype = F.Scalar {
          scalar_type = D.Simple P.String;
          required = false;
        }
    };
  ]

let account_status () =
  Lib.Codesystem.make ~name:"AccountStatus" ~valueset:"http://hl7.org/fhir/ValueSet/account-status" ~description:"Test Account Status" Lib.Codesystem.Complete [
    {
      code = "Test";
      display = "Test";
      description = "Nothing here"
    };
    {
      code = "Test2";
      display = "Test2 Code";
      description = "What should go here?"
    }
  ]


let v () =
  let table = Hashtbl.create (module String) in
  Hashtbl.set table ~key:"patient_optional" ~data:(Lib.Resource.Structure (patient_opt ()));
  Hashtbl.set table ~key:"patient_required" ~data:(Lib.Resource.Structure (patient_reqed ()));
  Hashtbl.set table ~key:"patient_arity_optional" ~data:(Lib.Resource.Structure (patient_arity_opt
                                                           ()));
  Hashtbl.set table ~key:"patient_arity_required" ~data:(Lib.Resource.Structure (patient_arity_req ()));
  Hashtbl.set table ~key:"account" ~data:(Lib.Resource.Structure (account ()));
  Hashtbl.set table ~key:"account_status" ~data:(Lib.Resource.CodeSystem (account_status ()));
  Hashtbl.set table ~key:"patient_union" ~data:(Lib.Resource.Structure (patient_union ()));
  table
