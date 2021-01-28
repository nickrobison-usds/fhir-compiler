open! Base
open Lib
open Lwt

module STU3_Parser = struct

  type structure = {
    element: Element.t list
  } [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

  type t = {
    resourceType: string;
    id: string;
    name: string;
    snapshot: structure
  } [@@deriving yojson, show, eq] [@@yojson.allow_extra_fields]

  let create typ name elements =
    {
      resourceType = typ;
      id = name;
      name = name;
      snapshot = {
        element = elements
      }
    }

  let name = "STU3"

  let typ t =
    t.resourceType

  let elements t =
    t.snapshot.element

  let append_to_complex compl appender =
    match compl, appender with
    | Some c, Some a -> (
        match c, a with
        | Fhir.Field c, Fhir.Field a -> (
            let dtype = match c.datatype with
              | Fhir.Complex c -> Fhir.Complex {
                  l = c.l;
                  components = c.components @ [a.datatype];
                }
              | _ -> raise (Invalid_argument "Cannot add to non-complex") in
            Some (Fhir.Field {
              path = c.path;
              id = c.id;
              datatype = dtype
            })
          ))
    | None, Some a -> Some a
    | _, _ -> None


  let swap_and_emit previous e =
    let elem = Element.to_field e and
    pth = Element.path e in
    let pth', elem' = !previous in
    Stdio.print_endline ((Path.to_string pth') ^ " is parent? " ^ (Path.to_string pth));
    if (Path.is_parent pth' pth) then (
      Stdio.print_endline "Is parent";
      let c' = append_to_complex elem' elem in
      previous := (pth, c');
      []
    )
    else (
      previous := (pth, elem);
      Stdio.print_endline ("Emitting:" ^ (Path.to_string pth'));
      [elem']
    )

  let handle_elements_inner hd tail =
    Stdio.print_endline ("Starting with: " ^ (Path.to_string (Element.path hd)));
    let previous = ref (Element.path hd, Element.to_field hd) in
    let swapper = swap_and_emit previous in
    let rec h elements =
      match elements with
      | e :: lst -> swapper e @ h lst
      | [] -> []
    in
    let bound = h tail in
    bound @ [(snd !previous)]

  let handle_elements elements =
    match elements with
    | [] -> []
    | x :: [] -> [Element.to_field x]
    | hd :: tail -> handle_elements_inner hd (List.rev tail)

  let to_resource t =
    let name = t.name in
    let fields = List.filter_opt (handle_elements (elements t)) in
    Resource.make name fields

  let to_fhir json =
    let t = t_of_yojson json in
    to_resource t

  let parse () =
    let stream, pusher = Lwt_stream.create () in
    let _ = Downloader.download "http://hl7.org/fhir/STU3/examples-json.zip" >>= fun pth ->
      Downloader.unzip pth pusher;
      Lwt.return_unit
    in
    stream
    |> Lwt_stream.map Yojson.Safe.from_string
    |> Lwt_stream.map to_fhir
end

let () =
  Stdio.print_endline "Registering STU3 parser";
  Lib.Parser.register (module STU3_Parser) STU3_Parser.name
