let urls =
  [ "http://ocsigen.org"
  ; "http://openmirage.org"
  ; "http://ddg.gg"
  ; "http://github.com"
  ; "http://www.ocsigen.org"
  ; "http://www.openmirage.org"
  ; "http://www.ddg.gg"
  ; "http://www.github.com"
  ; "http://caml.inria.fr"
  ; "http://www.lri.fr/~marche/regexp/regexp-0.3.tar.gz"
  ; "http://ocsigen.org/lwt/api/Lwt"
  ; "http://www.lri.fr/~marche/regexp/regexp-0.3.tar.gz"
  ; "http://ocsigen.org/lwt/api/Lwt"
  ; "http://ocsi"
  ; "http://nodejs.org/docs/v0.3.1/api/buffers.html"
  ; "http://help.ubuntu.com/community/UpgradeNotes"
  ; "http://www-uxsup.csx.cam.ac.uk/pub/linux/ubuntu/"
  ; "http://www-uxsup.csx.cam.ac.uk/pub/linux/ubuntu"
  ; "http://extras.ubuntu.com/ubuntu"
  ; "http://ocsigen.org/js_of_ocaml/sources/lib/regexp.mli"
  ; "http://www.lri.fr/~marche/regexp/regexp-0.3.tar.gz"
  ; "http://ocsigen.org/lwt/api/Lwt"
  ; "http://ocsigen.org/js_of_ocaml/sources/lib/regexp.mli"
  ; "http:/nodejs.org/docs/v0.3.1/api/buffers.html"
  ; "http://help.ubuntu.com/community/UpgradeNotes"
  ; "http://www-uxsup.csx.cam.ac.uk/pub/linux/ubuntu/"
  ; "http://www-uxsup.csx.cam.ac.uk/pub/linux/ubuntu"
  ; "http://extras.ubuntu.com/ubuntu"
  ; "http/nodejs.org/docs/v0.3.1/api/buffers.html"
  ; "http://help.ubuntu.com/community/UpgradeNotes"
  ; "http://www-uxsup.csx.cam.ac.uk/pub/linux/ubuntu/"
  ; "ht//www-uxsup.csx.cam.ac.uk/pub/linux/ubuntu"
  ; "httpxtras://.ubuntu.com/ubuntu"
  ; "http://twitter.com"
  ]

let time f =
  let t0 = Unix.gettimeofday () in
  ignore (f ());
  let tf = Unix.gettimeofday () in
  tf -. t0

let run_n f n =
  let rec aux m =
    if m >= n then
      ()
    else
      (ignore (f ()); aux (succ m))
  in
  aux 0




