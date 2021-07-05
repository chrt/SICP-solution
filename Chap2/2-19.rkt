#lang sicp

(define first-denomination car)
(define except-first-denomination cdr)
(define no-more? null?)
; The order of the list coin-values does not affect the answer produced by cc
; Our algorithm does not assume any condition on the order of this list
