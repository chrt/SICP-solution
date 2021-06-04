#lang sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; a. 12.15 -> 4.05 -> 1.35 -> 0.45 -> 0.15 -> 0.05
;    5 times
; b. Space: Theta(log a) (Need to remember to apply p)
;    Number of steps: Theta(log a)