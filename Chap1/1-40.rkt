#lang sicp
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))
((cubic 1 2 -1) 2)
