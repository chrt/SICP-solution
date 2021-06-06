#lang sicp

; smallest-divisor

(define (next d)
  (if (= d 2)
      3
      (+ 2 d)))

(define (smallest-divisor n)
  (find-divisor n 3))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else
         (find-divisor n (next test-divisor)))))

(define (square a) (* a a))
(define (divides? a b) (= (remainder b a) 0))

; prime?

(define (prime? n)
  (= (smallest-divisor n) n))

; timed-prime-test

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; 10^3: 7 ms (6 ms) 1.17
; 10^4: 11 ms (13 ms) 0.85
; 10^5: 21 ms (28 ms) 0.75
; 10^6: 56 ms (78 ms) 0.72
; No
; Possible reason: the cost of next and calling next