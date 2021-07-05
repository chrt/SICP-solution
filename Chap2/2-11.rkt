#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound c) (cdr c))
(define (lower-bound c) (car c))
(define (type x)
  (let ([a (lower-bound x)]
        [b (upper-bound x)])
    (cond ((and (>= a 0) (>= b 0)) 0)
          ((and (<= a 0) (<= b 0)) 1)
          (else 2))))
(define (mul-interval x y)
  (let ([x1 (lower-bound x)]
        [x2 (upper-bound x)]
        [y1 (lower-bound y)]
        [y2 (upper-bound y)]
        [tx (type x)]
        [ty (type y)])
    (cond ((and (= tx 0) (= ty 0)) (make-interval (* x1 y1) (* x2 y2)))
          ((and (= tx 0) (= ty 1)) (make-interval (* x2 y1) (* x1 y2)))
          ((and (= tx 0) (= ty 2)) (make-interval (* x2 y1) (* x2 y2)))
          ((and (= tx 1) (= ty 0)) (make-interval (* x1 y2) (* x2 y1)))
          ((and (= tx 1) (= ty 1)) (make-interval (* x2 y2) (* x1 y1)))
          ((and (= tx 1) (= ty 2)) (make-interval (* x1 y2) (* x1 y1)))
          ((and (= tx 2) (= ty 0)) (make-interval (* x1 y2) (* x2 y2)))
          ((and (= tx 2) (= ty 1)) (make-interval (* x2 y1) (* x1 y1)))
          (else (make-interval (min (* x1 y2) (* x2 y1)) (max (* x1 y1) (* x2 y2)))))))


