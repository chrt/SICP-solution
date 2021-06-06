#lang sicp

(define (square a) (* a a))
(define (divides? a b) (= (remainder b a) 0))
(define (even? n) (= (remainder n 2) 0))

; prime?

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else
         (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= (smallest-divisor n) n))

; expmod

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

; pseudoprime?

(define (pseudoprime? n)
  (define (test a)
    (or (= a n)
        (and (= a (expmod a n n)) (test (+ a 1)))))
  (and (not (prime? n)) (test 2)))

#;'(561 1105 1729 2465 2821 6601)
