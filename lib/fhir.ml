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

type packed = Packed: 'src field -> packed


module Resource = struct
  type t = {
    name: string;
    fields: packed list
  }

  let make name fields =
    {
      name = name;
      fields = fields;
    }

  let fields t =
    t.fields
end


let get_fields: 'src. 'src typ  -> 'src field list = function
  | Object o -> o.fields
  | Scalar _ -> []

let dump_print: 'src. 'src -> 'src typ -> string =
  fun src typ ->
  match typ with
  | Scalar s -> s.emit src
  | Object o -> o.name
