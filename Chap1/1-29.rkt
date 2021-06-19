#lang sicp

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (term k)
    (* (f (+ a (* k h)))
       (cond ((= k 0) 1)
             ((= k n) 1)
             (else (+ 2 (* 2 (remainder k 2)))))))
  (define (sum term k n)
    (if (> k n) 0
        (+ (term k) (sum term (+ k 1) n))))
  (/ (* h (sum term 0 n)) 3))

(define (cube x) (* x x x))

; For any even n,
#;(simpson-integral cube 0 1 n)
; is equal to 1/4
