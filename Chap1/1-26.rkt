#lang sicp

#;(expmod base (/ exp 2) m)
; is called twice, so no result is reused

#;(* a a a a a)
; is computed in this way:
#;(* a (* (* (* a 1) (* a 1)) (* (* a 1) (* a 1))))