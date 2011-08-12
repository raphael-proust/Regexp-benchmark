
let re () = Pcre.regexp "(?:0*)http://(?:(?:[0-9a-zA-Z.-])+)(?:(?:/.*)?)"

let m rex s = Pcre.pmatch ~rex s

let f r us = List.for_all (m r) us

