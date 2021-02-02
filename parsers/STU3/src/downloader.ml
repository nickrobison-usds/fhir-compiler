open Base
open Lwt
open Cohttp
open Cohttp_lwt_unix

let src = Logs.Src.create "stu3.downloader" ~doc:"STU3 Resource Downloader"

module Log = (val Logs.src_log src : Logs.LOG)

let debug fmt s =
  Log.debug (fun f -> f fmt s)

let dir f = Fpath.(v f)

let body_writer body =
  let open Stdio.Out_channel in
  let pth = dir "2examples.zip" in
  let _ = Bos.OS.File.must_exist pth in
  Stdio.Out_channel.with_file (Fpath.to_string pth) ~f:(fun oc -> output_string oc body);
  pth


let reg = Re.Pcre.regexp "structure|codesystem"

let download uri =
  debug "Downloading from %s\n" uri;
  Client.get (Uri.of_string uri) >>= fun (resp, body) ->
  let code = resp |> Response.status |> Code.code_of_status in
  debug "Response code: %d\n" code;
  debug "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
  Cohttp_lwt.Body.to_string body >|=
  body_writer

let handle_entry pusher ic (entry: Zip.entry) =
  debug "Reading: %s\n" entry.filename;
  match Re.matches reg entry.filename with
  | [] -> ()
  | _ -> begin
      debug "Emitting: %s\n" entry.filename;
      let s = Some (Zip.read_entry ic entry) in
      pusher s
    end

let unzip pth pusher =
  (*debug "Unzipping from %s" (Fpath.to_string pth);*)
  let ic = Zip.open_in (Fpath.to_string pth) in
  let handle_entry = handle_entry pusher ic in
  let entries = Zip.entries ic in
  let entries = List.filter ~f:(fun (e: Zip.entry) -> List.length (Re.matches reg e.filename) > 0)  entries in
  let entries = List.take entries 10 in
  List.iter ~f:handle_entry entries;
  pusher None
