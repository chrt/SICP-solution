#lang sicp
(define (make-rat n d)
  (if (= d 0)
      (error "make-rat: the denominator should be nonzero")
      (let ([m (abs n)]
            [k (abs d)])
        (let ([g (gcd m k)])
          (if (>= (* n d) 0)
            (cons (/ m g) (/ k g))
            (cons (- (/ m g)) (/ k g)))))))
