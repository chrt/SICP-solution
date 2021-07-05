#lang sicp

(define (same-parity first . rest)
  (define p (remainder first 2))
  (define (filter items)
    (cond ((null? items) nil)
          ((= p (remainder (car items) 2)) (cons (car items) (filter (cdr items))))
          (else (filter (cdr items)))))
  (cons first (filter rest)))
