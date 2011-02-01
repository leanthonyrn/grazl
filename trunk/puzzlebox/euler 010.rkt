
;; Grazl.
;; Public domain.

;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;; Find the sum of all the primes below two million.
#lang racket

(define primes (make-vector 2000000 #t))
(define total 0)

;; sieve
(for ([x (in-range 2 2000000)])
  (and (vector-ref primes x)
    (begin
      (set! total (+ total x))

      ;; mark numbers that can't be prime
      (let loop ([y (+ x x)])
        (and (< y 2000000)
          (vector-set! primes y #f)
          (loop (+ y x)))))))

(printf "Euler 010: ~a \n" total)

