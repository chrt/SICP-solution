#lang sicp

(define (cons a b)
  (cond ((and (= a 0) (= b 0)) 1)
        ((= a 0) (* 3 (cons a (- b 1))))
        (else (* 2 (cons (- a 1) b)))))

(define (divides? n d) (= 0 (remainder n d)))

(define (car c)
  (if (divides? c 2)
      (+ 1 (car (/ c 2)))
      0))

(define (cdr c)
  (if (divides? c 3)
      (+ 1 (cdr (/ c 3)))
      0))
