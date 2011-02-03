
;; Grazl.
;; Public domain.

;; If the numbers 1 to 5 are written out in words: one, two, three,
;; four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used 
;; in total.

;; If all the numbers from 1 to 1000 (one thousand) inclusive were 
;; written out in words, how many letters would be used?

;; NOTE: Do not count spaces or hyphens. For example, 342 (three 
;; hundred and forty-two) contains 23 letters and 115 (one hundred 
;; and fifteen) contains 20 letters. The use of "and" when writing 
;; out numbers is in compliance with British usage.
#lang racket

(define words '(

   ;; [1..9] in [1..100] (90) in [100..1000] -> 190
   (["one" "two" "three" "four" "five" "six" "seven" "eight" "nine"] 190)

   ;; [10/19 ... 910/919] -> 10
   (["ten"     "eleven"  "twelve"    "thirteen" "fourteen"
     "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"] 10)

   ;; [20..90] in [0..100] (10) in [100..1000] -> 100
   (["twenty" "thirty" "forty"  "fifty" "sixty" "seventy" "eighty" "ninety"] 100)
  
   ;; hundreds: > 99, and: > 99 thousands: 1 -> 891
   (["hundred"] 900) (["one" "thousand"] 1) (["and"] 891)))

(printf "Euler 017: ~a \n"
  (let ([count 0])
    (for-each
      (lambda (words-times)
        (set! count
           (+ count
              (apply + (map (lambda (x) (* (string-length x) (cadr words-times)))
                            (car words-times))))))
      words)
    count))

