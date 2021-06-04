#lang sicp
; Copied from the text
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (average a b) (/ (+ a b) 2))

(define (improve guess x) (average guess (/ x guess)))

(define (square x) (* x x))

(define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; The absolute error 0.001 is insufficient for small numbers.
(define small 0.0001)
(good-enough? 0.03 small)
; #t
; Indeed, abs(0.03^2 - 0.0001) = 0.0008 < 0.001
(square (sqrt small))
; 0.0010438358335233748

; On the other hand, it is too strict for big numbers.
(define big 10000000000000.0) ; 1e13
; (sqrt big)
; does not terminate
(define (n-times f n)
  (if (= n 0)
      (lambda (x) x)
      (lambda (x) ((n-times f (- n 1)) (f x)))))
(define guess ((n-times (lambda (x) (improve x big)) 100)
               1.0))
guess
; 3162277.6601683795
(good-enough? guess big)
; #f
(square guess)
; 10000000000000.002
(= (improve guess big) guess)
; #t
; This guess is the best within our current precision,
; but it's still not good enough by our criterion.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (good-enough?-v2 old new) (< (abs (- old new))
                                     (abs (* 1e-5 old))))
(define (sqrt-iter-v2 old new x)
  (if (good-enough?-v2 old new)
      (improve new x)
      (sqrt-iter-v2 new (improve new x) x)))
(define (sqrt-v2 x) (sqrt-iter-v2 1.0 (improve 1.0 x) x))

(sqrt 1e-8)
; 0.03125010656242753
(sqrt-v2 1e-8)
; 9.999999999999999e-005
(sqrt-v2 small)
; 0.01
(sqrt-v2 big)
; 3162277.6601683795
(sqrt-v2 1e18)
; 1000000000.0

; Better!
