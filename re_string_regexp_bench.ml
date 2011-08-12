
open Regexp

let re () = Re.from_string "(0*)http://(([0-9a-zA-Z.\\-])+)((/.*)?)"

let m r s = match Re.match_string r s 0 with
  | None -> false
  | Some e -> e = String.length s


let f r us = List.for_all (m r) us


