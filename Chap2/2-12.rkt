#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound c) (car c))
(define (upper-bound c) (cdr c))

(define (make-center-percent center percent)
  (let ([width (* center percent)])
    (make-interval (- center width) (+ center width))))

(define (percent i)
  (let ([a (lower-bound i)]
        [b (upper-bound i)])
    (/ (- b a) (+ b a))))
