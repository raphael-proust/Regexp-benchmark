
open Regexp

let re () = Re.compile
  (Re.seq
    (Re.star (Re.char '0'))
    (Re.seq
      (Re.string "http://")
      (Re.seq
        (Re.some
          (Re.alt (Re.char_interv 'a' 'z')
          (Re.alt (Re.char_interv 'A' 'Z')
          (Re.alt (Re.char_interv '0' '9')
          (Re.alt (Re.char '.') (Re.char '-')))))
        )
        (Re.opt
          (Re.seq
            (Re.char '/')
            (Re.star (Re.char_interv (char_of_int 0) (char_of_int 255)))
          )
        )
      )
    )
  )

let m r s = match Re.match_string r s 0 with
  | None -> false
  | Some e -> e = String.length s

let f r us = List.for_all (m r) us

