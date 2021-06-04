#lang sicp
(define (square x) (* x x))
(define (sum-of-squares a b) (+ (square a) (square b)))

(define (foo a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= b a) (<= b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))))

(define (bar a b c)
  (- (+ (square a) (square b) (square c)) (square (min (min a b) c))))

(foo 2 3 3)
(foo 4 2 3)
(bar 2 3 3)
(bar 4 2 3)
