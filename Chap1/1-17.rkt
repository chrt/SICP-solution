#lang sicp

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (even? n) (= (remainder n 2) 0))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))