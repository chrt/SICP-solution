#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Normal-order evaluation: Fully expand and then reduce

(define (gcd-count-normal a b ra rb)
  (+ rb
     (if (= b 0)
         ra
         (gcd-count-normal b (remainder a b) rb (+ 1 ra rb)))))

#; (gcd 206 40)
;  Transform to
#; (gcd 40 (remainder 206 40))
;  Evaluate
#; (= (remainder 206 40) 0)
;  Transform to
#; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;  Evaluate
#; (= (remainder 40 (remainder 206 40)) 0)
;  Transform to
#; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;  Evaluate
#; (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;  Transform to
#; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;  Evaluate
#; (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;  Evaluate
#; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;  Total
#; 18

; Applicative-order evaluation: Evaluate the arguments and then apply

(define (gcd-count-applicative a b)
  (if (= b 0)
      0
      (+ 1 (gcd-count-applicative b (remainder a b)))))

#; (gcd 206 40)
;  Evaluate
#; (remainder 206 40)
;  Transform to
#; (gcd 40 6)
;  Evaluate
#; (remainder 40 6)
;  Transform to
#; (gcd 6 4)
;  Evaluate
#; (remainder 6 4)
;  Transform to
#; (gcd 4 2)
;  Evaluate
#; (remainder 4 2)
;  Transform to
#; (gcd 2 0)
;  Yield
#; 2
;  Total
#; 4
