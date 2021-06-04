#lang sicp

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (even? n) (= (remainder n 2) 0))

(define (fib-iter a b p q count) ; (T(p,q))^n (a, b) = (Fib(n+1), Fib(n))
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else
         (fib-iter
          (+ (* b q) (* a q) (* a p))
          (+ (* b p) (* a q))
          p
          q
          (- count 1)))))
; In other words, the square of the matrix
; q+p q
; q   p
; is still of this form