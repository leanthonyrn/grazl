
;; Grazl.
;; Public domain.

;; A palindromic number reads the same both ways. 
;; The largest palindrome made from the product of two 
;; 2-digit numbers is 9009 = 91 * 99.

;; Find the largest palindrome made from the product 
;; of two 3-digit numbers.
#lang racket

;; P = A * B && A, B = ???
;; 100 < A/B < 999

(define (palindrome? n)
  (let ([dt (number->string n)])
    (and (eq? (string-ref dt 0) (string-ref dt 5))
         (eq? (string-ref dt 1) (string-ref dt 4))
         (eq? (string-ref dt 2) (string-ref dt 3)))))

(printf "Euler 004: ~a \n"
  (let ([result 0])
    (for ([x (in-range 500 1000)])
      (for ([y (in-range 500 1000)])
        (let ((number (* x y)))
          (and (> number result) (palindrome? number)
             (set! result number)))))
    result))

