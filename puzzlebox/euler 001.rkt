
;; Grazl.
;; Public domain.

;; If we list all the natural numbers below 10 that are 
;; multiples of 3 or 5, we get 3, 5, 6 and 9. 
;; The sum of these multiples is 23.

;; Find the sum of all the multiples of 3 or 5 below 1000.
#lang racket

;; sum n = n * m * (m + 1) / 2
;; where m is: (max in series - 1) / n
(define (sum n)
  (let ([m (floor (/ (- 1000 1) n))])
    (* n m (/ (+ m 1) 2))))

(printf "Euler 001: ~a \n"
  (- (+ (sum 3) (sum 5)) (sum 15)))

