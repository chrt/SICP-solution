#lang sicp

(define tolerance 0.00001)

(define (close-enough? u v)
  (< (abs (- u v)) tolerance))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ([next (f guess)])
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x)
    (/ (+ x
          (f x))
       2)))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

; 2  1
; 3  1
; 4  2
; 5  2
; 6  2
; 7  2
; 8  3
; 9  3
; 10 3 
; ...
; 15 3
; 16 4

(define (nth-power n x)
  ((repeated (lambda (y) (* x y)) n) 1))

(define (nth-root n x)
  (define (log2 x)
    (if (< x 2)
        0
        (inc (log2 (/ x 2)))))
  (fixed-point
   ((repeated average-damp (log2 n)) (lambda (y) (/ x (nth-power (- n 1) y))))
   1.0))
