
;; Grazl.
;; Public domain.

;; By listing the first six prime numbers: 2, 3, 5, 7, 11, 
;; and 13, we can see that the 6th prime is 13.

;; What is the 10001(st) prime number?
#lang racket

(define (prime? n)

  ;; test odd numbers:
  (let loop ([k 3])
    (if (> (* k k) n) #t
      (if (zero? (remainder n k)) #f
        (loop (+ k 2))))))

(printf "Euler 007: ~a \n"
  (let loop ([i 1] [count 1])
    (if (prime? i)

      ;; again, loop with odd numbers:
      (if (= count 10001) i
        (loop (+ i 2) (+ count 1)))
    (loop (+ i 2) count))))

