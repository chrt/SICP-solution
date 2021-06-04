#lang sicp

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (even? n) (= (remainder n 2) 0))

(define (fast-mult a b) (fast-mult-iter 0 a b))

(define (fast-mult-iter s a b) ; s + a * b
  (cond ((= b 0) s)
        ((even? b) (fast-mult-iter s (double a) (halve b)))
        (else (fast-mult-iter (+ s a) a (- b 1)))))