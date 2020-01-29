open Base
open Lwt
open Cohttp
open Cohttp_lwt_unix

let dir f = Fpath.(v f)

let body_writer body =
  let open Stdio.Out_channel in
  let pth = dir "2examples.zip" in
  let _ = Bos.OS.File.must_exist pth in
  Stdio.Out_channel.with_file (Fpath.to_string pth) ~f:(fun oc -> output_string oc body)



let download uri =
  Stdio.print_endline "Downloading";
  Client.get (Uri.of_string uri) >>= fun (resp, body) ->
  Stdio.print_endline "Downloaded";
  let code = resp |> Response.status |> Code.code_of_status in
  Stdio.printf "Response code: %d\n" code;
  Stdio.printf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
  Cohttp_lwt.Body.to_string body >|=
  body_writer >>= fun () ->
  Lwt.return []
