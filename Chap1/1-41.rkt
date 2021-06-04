#lang sicp
(define (double f)
  (lambda (x)
    (f (f x))))
(((double (double double)) inc) 5) ; 21

; ((double double) f) = f^(4)
; ((double (double double)) f) = (f^(4))^(4) = f^(16)
