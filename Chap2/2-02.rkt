#lang sicp

; segment

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

; point

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (print-point p)
  ;(newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; midpoint

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint-segment segment)
  (let ([start (start-segment segment)]
        [end (end-segment segment)])
    (make-point (average (x-point start) (x-point end))
                (average (y-point start) (y-point end)))))


