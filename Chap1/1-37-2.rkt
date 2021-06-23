#lang sicp

; Iterative
(define (cont-frac n d k)
  (define (f i result)
    (if (= i 0)
        result
        (f (- i 1) (/ (n i) (+ (d i) result)))))
  (f k 0))

#;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10) ; 0.6179775280898876
#;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11) ; 0.6180555555555556
