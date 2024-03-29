
;; Grazl.
;; Public domain.

;; The following iterative sequence is defined for the set 
;; of positive integers:
;;
;; n -> n / 2  (n is even)
;; n -> 3n + 1 (n is odd)

;; Using the rule above and starting with 13, we generate 
;; the following sequence:
;; 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

;; It can be seen that this sequence (starting at 13 and finishing at 1) 
;; contains 10 terms. Although it has not been proved yet (Collatz Problem), 
;; it is thought that all starting numbers finish at 1.
;; Which starting number, under one million, produces the longest chain?
#lang racket

(define (collatz num)
  (if (even? num)
    (/ num 2)
    (+ (* num 3) 1)))

(define cache 
  (make-vector 1000000 #f))

(define (collatz-length num)
  (if (= num 1) 1

  ;; in cache range?
  (if (< num 1000000)

    ;; lookup or store.
    (or (vector-ref cache num)
        (let ((count (+ 1 (collatz-length (collatz num)))))
          (vector-set! cache num count)
          count))
    
    ;; calculate.
    (+ 1 (collatz-length (collatz num))))))

(let loop ([num 1] [result 0] [result-length 0])
  (if (< num 1000000)
    (let ([this (collatz-length num)])
       (if (> this result-length)
          (loop (+ num 1) num this)
          (loop (+ num 1) result result-length)))
      
    ;; done.
    (printf "Euler 014: ~a \n" result)))

