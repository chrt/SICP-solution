#lang sicp

(define (square a) (* a a))
(define (even? n) (= (remainder n 2) 0))

(define (fast-expt base exp)
  (cond ((= exp 0) 1)
        ((even? exp)
          (square (fast-expt base (/ exp 2))))
        (else
          (* base (fast-expt base (- exp 1))))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (expmod-naive base exp m)
  (remainder (fast-expt base exp) m))

; Correct, but this procedure would not serve as well for our fast prime tester
; The return value of fast-expt can be very large,
; so the time of arithmetic operations can no longer be regarded as constant