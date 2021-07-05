#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound c) (cdr c))
(define (lower-bound c) (car c))
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

(define (div-interval x y)
  (let ([a (lower-bound y)]
        [b (upper-bound y)])
    (if (and (<= a 0) (<= 0 b))
        (error "div-interval: dividing by an interval that spans zero")
        (mul-interval x
                (make-interval
                 (/ 1.0 b)
                 (/ 1.0 a))))))
