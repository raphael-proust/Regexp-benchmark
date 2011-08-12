
let re () = Str.regexp "\\(0*\\)http://\\([0-9a-zA-Z.-]+\\)\\(\\(/.*\\)?\\)"

let m r s = Str.string_match r s 0

let f r us = List.for_all (m r) us

