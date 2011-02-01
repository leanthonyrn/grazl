
;; Grazl.
;; Public domain.

;; The prime factors of 13195 are 5, 7, 13 and 29.
;; What is the largest prime factor of the number 600851475143 ?
#lang racket

(printf "Euler 003: ~a \n"

  ;; i = 3, 5, 7, 9 ... sqrt(n)
  ;; n = 600851475143       
  (let loop ([i 3] [n 600851475143])
    (if (<= (* i i) n)
      (if (zero? (modulo n i))
        (loop i (/ n i))
        (loop (+ i 2) n)) n)))

