
;; Grazl.
;; Public domain.

;; n! means n * (n - 1) * ... * 3 * 2 * 1
;; Find the sum of the digits in the number 100!
#lang racket

(require (only-in srfi/1 iota))

;; R5RS does not guarantee (zero? (char->integer #\0))
(define (char->number char)
  (case char
    [(#\0) 0] [(#\1) 1] [(#\2) 2] [(#\3) 3] [(#\4) 4]
    [(#\5) 5] [(#\6) 6] [(#\7) 7] [(#\8) 8] [(#\9) 9]))

(printf "Euler 020: ~a \n"
  (apply +
    (map char->number 
      (string->list (number->string (apply * (iota 100 1)))))))

