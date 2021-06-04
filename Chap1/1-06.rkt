#lang sicp
; Copied from the old version
(define (improve guess x) (average guess (/ x guess)))

(define (average a b) (/ (+ a b) 2))

(define (square x) (* x x))

(define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

; (sqrt-iter 1.0 9)

; All subexpressions, the recursion in particular, are evaluated before passed into new-if,
; so the above call will never terminate
