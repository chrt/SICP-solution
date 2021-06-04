#lang sicp

(define (C n k)
  (if (or (= k 0) (= k n))
      1
      (+ (C (- n 1) k) (C (- n 1) (- k 1)))))

(C 4 2)
; 6
(C 4 3)
; 4
