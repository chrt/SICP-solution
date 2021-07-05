#lang sicp

(define (reverse items)
  (define (reverse-iter items reversed)
    (if (null? items)
        reversed
        (reverse-iter (cdr items) (cons (car items) reversed))))
  (reverse-iter items nil))
