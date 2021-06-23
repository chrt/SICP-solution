#lang sicp

(define (cont-frac n d k)
  (define (f i result)
    (if (= i 0)
        result
        (f (- i 1) (/ (n i) (+ (d i) result)))))
  (f k 0))

(define (e k)
  (+ 2 (cont-frac (lambda (i) 1.0)
                  (lambda (i) (if (= 2 (remainder i 3))
                                  (* 2.0 (/ (+ i 1) 3))
                                  1.0))
                  k)))

#;(e 20) ; 2.718281828459045
