#lang sicp
(define (double f)
  (lambda (x)
    (f (f x))))
(((double (double double)) inc) 5) ; 21

; ((double g) f) = (g (g f))
; ((double double) f) = f^(4)
; ((double (double double)) f) = (f^(4))^(4) = f^(16)

; (double double) = double^(2)
; (double (double double)) = double^(2) * double^(2) = double^(4)
; ((double (double double)) f) = double^(3) * (double f) = double^(3) * f^(2) = ... = f^(16)
