
;; Grazl.
;; Public domain.

;; 2^(15) = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
;; What is the sum of the digits of the number 2^(1000)
#lang racket

;; R5RS does not guarantee (zero? (char->integer #\0))
(define (char->number char)
  (case char
    [(#\0) 0] [(#\1) 1] [(#\2) 2] [(#\3) 3] [(#\4) 4]
    [(#\5) 5] [(#\6) 6] [(#\7) 7] [(#\8) 8] [(#\9) 9]))

(printf "Euler 016: ~a \n"
  (apply + (map char->number
    (string->list (number->string (expt 2 1000))))))

