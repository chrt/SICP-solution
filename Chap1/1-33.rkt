#lang sicp

(define (filtered-accumulate
         filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (filter a)
                  (combiner result (term a))
                  result))))
  (iter a null-value))

; the sum of the squares of the prime numbers in the interval a to b
#;(filtered-accumulate prime? + 0 square a inc b)
; the product of all the positive integers less than n that are relatively prime to n
#;(filtered-accumulate filter * 1 identity 1 inc (- n 1))
#;(define (filter i) (= 1 (gcd i n)))
