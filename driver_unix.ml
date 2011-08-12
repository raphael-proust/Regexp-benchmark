
let get_int i = int_of_string (Sys.argv.(i))

let runs  = get_int 1
let comps = get_int 2
let execs = get_int 3
let prep  = try get_int 4 with _ -> 0

let prepend_0s i s = String.make i '0' ^ s

let urls =
  List.map (prepend_0s prep)
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



let r () =

  Gc.compact ();

  let t =
    (time (fun () ->
      run_n
        (fun () ->
          let r = Str_regexp_bench.re () in
          run_n (fun () -> Str_regexp_bench.f r urls) execs
        )
        comps
    ))
  in
  Printf.printf "%f %!" t;
  Printf.eprintf ".%!";

  Gc.compact ();

  let t =
    (time (fun () ->
      run_n
        (fun () ->
          let r = Re_regexp_bench.re () in
          run_n (fun () -> Re_regexp_bench.f r urls) execs
        )
        comps
    ))
  in
  Printf.printf "%f %!" t;
  Printf.eprintf ".%!";

  Gc.compact ();

  let t =
    (time (fun () ->
      run_n
        (fun () ->
          let r = Re_string_regexp_bench.re () in
          run_n (fun () -> Re_string_regexp_bench.f r urls) execs
        )
        comps
    ))
  in
  Printf.printf "%f %!" t;
  Printf.eprintf ".%!";

  Gc.compact ();

  let t =
    (time (fun () ->
      run_n
        (fun () ->
          let r = Pcre_regexp_bench.re () in
          run_n (fun () -> Pcre_regexp_bench.f r urls) execs
        )
        comps
    ))
  in
  Printf.printf "%f %!" t;
  Printf.eprintf ".%!";

  Gc.compact ();

  let t =
    (time (fun () ->
      run_n
        (fun () ->
          let r = Pcre_nogroup_regexp_bench.re () in
          run_n (fun () -> Pcre_nogroup_regexp_bench.f r urls) execs
        )
        comps
    ))
  in
  Printf.printf "%f\n%!" t;
  Printf.eprintf ".%!";
  ()



let () = run_n r runs

