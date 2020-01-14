open! Core

type 'src typ =
  | Scalar of {
      name: string;
      emit: 'src -> string;
    }
  | Object of {
      name: string;
      fields: 'src field list;
    }
and 'src field = Field : {
    name: string;
    output_typ: 'out typ;
  } -> 'src field

let boolean = Scalar {
    name = "Boolean";
    emit = fun b -> Bool.to_string b;
  }

let code = Scalar {
    name = "Code";
    emit = fun c -> c;
  }

let date = Scalar {
    name = "Date";
    emit = fun d -> Date.to_string_iso8601_basic d
  }
