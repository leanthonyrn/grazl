
;; Grazl.
;; Public domain.

;; Each new term in the Fibonacci sequence is generated by adding 
;; the previous two terms. By starting with 1 and 2, the first 10 
;; terms will be:
;; 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

;; Find the sum of all the even-valued terms in the sequence
;; which do not exceed four million.
#lang racket

(define fib-list
  (let loop ([ls '(1 1)])
    (if (<= (car ls) 4000000)
      (loop (cons (+ (car ls) (cadr ls)) ls)) (cdr ls))))

(printf "Euler 002: ~a \n"
  (let ([elements (length fib-list)])
    (let loop ([i 0] [sum 0])
      (if (< i elements)
        (loop (+ i 3) (+ sum (list-ref fib-list i)))
        sum))))
