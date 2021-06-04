#lang sicp
(define (p) (p))
(define (test x y) (if (= x 0) 0 y))
; Assume that the evaluation rule for the special form if is the same
; whether the interpreter is using normal or applicative order

; (test 0 (p))

; Applicative-order evaluation: infinite recursion
; The interpreter tries to evaluate (p) before passing it to test.

; Normal-order evaluation: 0
; The body is expanded to (if (= 0 0) 0 (p)) and then this special form is evaluated.
; The predicate (= 0 0) evaluates to #t, so (p) is not evaluated.
