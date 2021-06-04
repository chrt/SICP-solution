#lang sicp
(define (iterative-improve good-enough? improve)
  (define (try guess)
    (let ([next (improve guess)])
      (if (good-enough? guess)
          next
          (try next))))
  try)

(define (square x) (* x x))

(define (sqrt x)
  ((iterative-improve
    (lambda (y) (< (abs (- (square y) x)) 0.001))
    (lambda (y) (/ (+ y (/ x y)) 2)))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (y) (< (abs (- y (f y))) 0.00001)) f)
   first-guess))
