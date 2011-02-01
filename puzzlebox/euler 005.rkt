
;; Grazl.
;; Public domain.

;; 2520 is the smallest number that can be divided by each 
;; of the numbers from 1 to 10 without any remainder.

;; What is the smallest number that is evenly divisible
;; by all of the numbers from 1 to 20?
#lang racket

;; iota.
(require srfi/1)

(printf "Euler 005: ~a \n"
  (apply lcm (iota 19 1)))

