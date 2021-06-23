#lang sicp

; Recursive
(define (cont-frac n d k)
  (define (f i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (f (+ i 1))))))
  (f 1))

#;(/ (- (sqrt 5) 1) 2)) ; 0.6180339887498949
#;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10) ; 0.6179775280898876
#;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11) ; 0.6180555555555556
