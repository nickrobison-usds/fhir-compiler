open Base
open Lwt
open Cohttp
open Cohttp_lwt_unix

let dir f = Fpath.(v f)

let body_writer body =
  let open Stdio.Out_channel in
  let pth = dir "2examples.zip" in
  let _ = Bos.OS.File.must_exist pth in
  Stdio.Out_channel.with_file (Fpath.to_string pth) ~f:(fun oc -> output_string oc body);
  pth

let reg = Re.Perl.compile_pat "^structure"

let download uri =
  Stdio.print_endline "Downloading";
  Client.get (Uri.of_string uri) >>= fun (resp, body) ->
  Stdio.print_endline "Downloaded";
  let code = resp |> Response.status |> Code.code_of_status in
  Stdio.printf "Response code: %d\n" code;
  Stdio.printf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
  Cohttp_lwt.Body.to_string body >|=
  body_writer

let handle_entry pusher ic (entry: Zip.entry) =
  Stdio.printf "Reading: %s\n" entry.filename;
  match Re.matches reg entry.filename with
  | [] -> ()
  | _ -> begin
      Stdio.printf "Emitting: %s\n" entry.filename;
      let s = Some (Zip.read_entry ic entry) in
      pusher s
    end

let unzip pth pusher =
  let ic = Zip.open_in (Fpath.to_string pth) in
  let handle_entry = handle_entry pusher ic in
  let entries = Zip.entries ic in
  let entries = List.filter ~f:(fun (e: Zip.entry) -> List.length (Re.matches reg e.filename) > 0)  entries in
  let entries = List.take entries 10 in
  List.iter ~f:handle_entry entries;
  Stdio.print_endline "Sending done";
  pusher None
