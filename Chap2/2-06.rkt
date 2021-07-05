#lang sicp

(define zero (lambda (f) (lambda (x) x))) ; zero maps any function to the identity map
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x))))) ; n+1 maps any function f to the function that maps x to f(n(f)(x))
; It can be proved by induction that n maps any function f to f^(n)
(define one (lambda (f) f))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add n m) ; n+1+1+...+1
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

; n + 0 := n
#;(add n zero)
#;n

; n + add_1(m) := add_1(n + m)

#;(add n (add-1 m))
#;(add n (lambda (f) (lambda (x) (f ((m f) x)))))
#;(lambda (f) (lambda (x) (((lambda (f) (lambda (x) (f ((m f) x)))) f) ((n f) x))))
#;(lambda (f) (lambda (x) ((lambda (x) (f ((m f) x))) ((n f) x))))
#;(lambda (f) (lambda (x) (f ((m f) ((n f) x)))))

#;(add-1 (add n m))
#;(add-1 (lambda (f) (lambda (x) ((m f) ((n f) x)))))
#;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) ((m f) ((n f) x)))) f) x))))
#;(lambda (f) (lambda (x) (f ((lambda (x) ((m f) ((n f) x))) x))))
#;(lambda (f) (lambda (x) (f ((m f) ((n f) x)))))

; Justify the name add_1: n + 1 = n + add_1(0) = add_1(n + 0) = add_1(n)
