#lang sicp

; smallest-divisor

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else
         (find-divisor n (+ test-divisor 1)))))

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

; search-for-prime

(define (search-for-primes begin end)
  (define (search begin end)
    (cond ((>= begin end) (values))
          (else (timed-prime-test begin)
                (search-for-primes (+ 2 begin) end))))
  (search (if (even? begin) (+ 1 begin) begin) end))

; 10^3: 1009, 1013, 1019 (6 ms)
; 10^4: 10007, 10009, 10037 (13 ms)
; 10^5: 100003, 100019, 100043 (28 ms)
; 10^6: 1000003, 1000033, 1000037 (78 ms)
; 10^7: 9999991, 10000019, 10000079 (246 ms)
; 10^8: 100000007, 100000037, 100000039 (975 ms)
; The ratio is between 2 and 4
; Not compatible: 1e6 / 78 = 1.3e4, 1e7 / 246 = 4e4, 1e8 / 975 = 1e5
; Besides, the runtime is not stable: the times for 10
#;(timed-prime-test 100000039)
; is as follows:
#;'(885 2455 812 856 1663 1656 825 818 811 1846)