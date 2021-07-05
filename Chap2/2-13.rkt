#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound c) (car c))
(define (upper-bound c) (cdr c))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (make-center-percent center percent)
  (let ([width (* center percent)])
    (make-interval (- center width) (+ center width))))
(define (percent i)
  (let ([a (lower-bound i)]
        [b (upper-bound i)])
    (/ (- b a) (+ b a))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

#;(percent (mul-interval (make-center-percent 1.0 0.012) (make-center-percent 1.5 0.034)))
#;0.045981239654221046

; percent([a-v, a+v] * [b-w, b+w]) = (v/a + w/b) / (1 + v/a w/b)
; approx. = percent([a-v, a+v]) + percent([b-w, b+w]) unnder the assumption of small percentage tolerances
