#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound c) (car c))
(define (upper-bound c) (cdr c))
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y)) (+ (upper-bound x) (upper-bound y))))
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
(define (make-center-percent center percent)
  (let ([width (* center percent)])
    (make-interval (- center width) (+ center width))))
(define (percent i)
  (let ([a (lower-bound i)]
        [b (upper-bound i)])
    (/ (- b a) (+ b a))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))

(define r1 (make-center-percent 6.8 0.1))
(define r2 (make-center-percent 4.7 0.05))
(let ([r (par1 r1 r2)])
  (cons (center r) (percent r))) #;(2.844199964577264 . 0.22613352145193347)
(let ([r (par2 r1 r2)])
  (cons (center r) (percent r))) #;(2.777440701636504 . 0.0705260392723452)
; The range of the expression is contained in both intervals, so both of them are correct answers.
; However, the second answer is the tightest. Both endpoints can be taken on.

(let ([x (make-interval 1 2)])
  (div-interval x x)) #;(0.5 . 2.0)
