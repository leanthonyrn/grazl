
;; Grazl.
;; Public domain.

;; A Pythagorean triplet is a set of three natural numbers, 
;; a < b < c, for which, a^2 + b^2 = c^2

;; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
;; There exists exactly one Pythagorean triplet for 
;; which a + b + c = 1000.

;; Find the product abc.
#lang racket

(printf "Euler 009: ~a \n"
  (let/ec done
    (for ([x (in-range 500)])
      (for ([y (in-range 500)])

         ;; a^2 + b^2 = (1000 - a b)^2
         (when (= (+ (* x x) (* y y)) (* (- 1000 x y) (- 1000 x y)))
           (done (* x y (- 1000 x y))))))))

