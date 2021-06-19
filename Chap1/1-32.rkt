#lang sicp

; (((1 * a) * a) * a) * a
(define (accumulate-iterative
         combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

; a * (a * (a * (a * 1)))
(define (accumulate-recursive
         combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive
                 combiner null-value term (next a) next b))))

(define (sum accumulate term a next b)
  (accumulate + 0 term a next b))

(define (product accumulate term a next b)
  (accumulate * 1 term a next b))
