#lang sicp

(define tolerance 0.00001)

(define (fixed-point f initial-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ([next (f guess)])
      (if (close-enough? guess next)
          next
          (try next))))
  (try initial-guess))

; phi = (1 + sqrt(5)) / 2 => (2 phi - 1)^2 = 5

(define phi (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
