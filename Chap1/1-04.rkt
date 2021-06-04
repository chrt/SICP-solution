#lang sicp
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; a + b when b > 0
; a - b otherwise
; a + abs(b)

(a-plus-abs-b 1 -2)
(a-plus-abs-b 1 2)
