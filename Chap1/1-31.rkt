#lang sicp

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a) (product-recursive term (next a) next b))))

(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial product n)
  (product (identity 1 inc n)))

(define (pi-product product n)
  (define (square n) (* n n))
  (define (pi-term n)
    (/ (* 4.0 n (+ n 1)) (square (+ (* 2 n) 1))))
  (* 4 (product pi-term 1 inc n)))

#;(pi-product product-recursive 1000)
#;3.142377365093882
#;(pi-product product-iterative 1000)
#;3.1423773650938855
