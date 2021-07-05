#lang sicp

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

; segment

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

; rectangle

;   representation 1
;   p = bottom-left point
;   v = (width, height)

(define (hide)
  (define (make-rectangle p v)
    (cons p v))

  (define (width-rectangle r)
    (car (cdr r)))

  (define (height-rectangle r)
    (cdr (cdr r)))

  (define (bottom-left-rectangle r)
    (car r))

  '())

;   representation 2
;   line segment from the bottom-left point to the upper-right point

(define (make-rectangle p v)
  (make-segment p
                (make-point (+ (x-point p) (car v))
                            (+ (y-point p) (cdr v)))))

(define (width-rectangle r)
  (- (x-point (end-segment r)) (x-point (start-segment r))))

(define (height-rectangle r)
  (- (y-point (end-segment r)) (y-point (start-segment r))))

(define (bottom-left-rectangle r)
  (car r))

;   perimeter

(define (perimeter-rectangle r)
  (* (+ (width-rectangle r) (height-rectangle r)) 2))

;   area
(define (area-rectangle r)
  (* (width-rectangle r) (height-rectangle r)))

; test
(define r (make-rectangle (make-point 1 2) (cons 4 5)))
(perimeter-rectangle r)
(area-rectangle r)
