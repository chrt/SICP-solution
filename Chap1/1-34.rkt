#lang sicp

(define (f g) (g 2))

#;(f f)
; gives an error:
; (f f) -> (f 2) -> (2 2)

; the argument to f should be a procedure that can accept a single 2 as the argument,
; which f does not satisfy
