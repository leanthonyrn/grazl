
;; Grazl.
;; Public domain.

;; Starting in the top left corner of a 2x2 grid, there 
;; are 6 routes (without backtracking) to the bottom right corner.
;; How many routes are there through a 20x20 grid?
#lang racket

;; k-combinations:
;; (n k) -> n! / k! (n - k)!
;; where n is the number of items to choose from and k
;; the total items to choose in each set.

(define (fact n)
  (if (= n 0) 1
    (* n (fact (- n 1)))))

(printf "Euler 015:: ~a \n"
  (let ([n 40] [k 20])
    (/ (fact n) (* (fact k) (fact (- n k))))))

