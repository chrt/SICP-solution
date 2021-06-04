#lang sicp
(define (find-zero F f old new)
  (define (good-enough? old new) (< (abs (- old new))
                                    (abs (* 1e-5 old))))
  (if (good-enough? old new)
      (improve F f new)
      (find-zero F f new (improve F f new))))

(define (improve F f x) (- x (/ (F x) (f x))))

(define (cube-root a)
  (define F (lambda (x) (- (* x x x) a)))
  (define f (lambda (x) (* 3 x x)))
  (find-zero F f 1.0 (improve F f 1.0)))

(define (cube x) (* x x x))
(cube (cube-root 10086))
10085.999999999998
