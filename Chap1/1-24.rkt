#lang sicp

; fast-prime?

(define (square a) (* a a))
(define (even? n) (= (remainder n 2) 0))

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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

; timed-prime-test

(define (timed-prime-test n times)
  (newline)
  (display n)
  (start-prime-test n times (runtime)))

(define (start-prime-test n times start-time)
  (if (fast-prime? n times)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; times = 5

; 10^3: 1009 (17 ms), 1013 (18 ms), 1019 (16 ms)
; 10^4: 10007 (19 ms), 10009 (19 ms), 10037 (20 ms)
; 10^5: 100003 (20 ms), 100019 (28 ms), 100043 (21 ms)
; 10^6: 1000003 (23 ms), 1000033 (23 ms), 1000037 (25 ms)

; Expect: T(a^m) / T(a^n) = m / n
; No
; Possible reason: Randomness in a; the number of 1's in bin(n)