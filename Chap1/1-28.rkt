#lang sicp

(define (square a) (* a a))
(define (even? n) (= (remainder n 2) 0))

(define (check a m)
  (define s (remainder (square a) m))
  (if (or (= a 1) (= a (- m 1)) (not (= s 1)))
      s
      0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (check (expmod base (/ exp 2) m) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= 1 (expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (better-fast-prime? n times)
  (or (= times 0) (and (miller-rabin-test n) (better-fast-prime? n (- times 1)))))