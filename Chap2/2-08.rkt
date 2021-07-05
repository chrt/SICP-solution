#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound c) (cdr c))
(define (lower-bound c) (car c))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
