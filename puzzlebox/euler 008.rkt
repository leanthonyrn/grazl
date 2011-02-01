
;; Grazl.
;; Public domain.

;; Find the greatest product of five consecutive digits 
;; in the 1000-digit number.
#lang racket

;; iota.
(require srfi/1)

(define digits
  (number->string 
    (with-input-from-file "data/euler 008.data" read)))

;; R5RS does not guarantee (zero? (char->integer #\0))
(define (char->number char)
  (case char
    [(#\0) 0] [(#\1) 1] [(#\2) 2] [(#\3) 3] [(#\4) 4]
    [(#\5) 5] [(#\6) 6] [(#\7) 7] [(#\8) 8] [(#\9) 9]))

;; Multiply five digits from P backwards as a list.
(define (product p)
  (apply * 
    (map (lambda (n) (char->number (string-ref digits (- p n))))
        '(0 1 2 3 4))))

;; ... 73167176531330624 ...
;;          P -> (7 * 3 * 1 * 6 * 7) = 882
(printf "Euler 008: ~a \n"
  (apply max (map product (iota 996 4))))

