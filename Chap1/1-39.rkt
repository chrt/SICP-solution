#lang sicp

(define (tan-cf x k)
  (define (f i result)
    (if (= i 0)
        result
        (f (- i 1) (/ (if (= i 1) x (* x x))
                      (- (- (* 2 i) 1) result)))))
  (f k 0.0))

(define pi 3.14159265359)

#;(tan-cf (/ pi 3) 10) ; 1.732050807569153
#;(sqrt 3) ; 1.7320508075688772
#;(tan (/ pi 3)) ; 1.732050807569153

#;(tan-cf 0.01 10) ; 0.010000333346667207
#;(tan 0.01) ; 0.010000333346667207
