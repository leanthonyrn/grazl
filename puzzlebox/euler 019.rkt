
;; Grazl.
;; Public domain.

;; You are given the following information, but you may prefer to do 
;; some research for yourself.

;; * 1 Jan 1900 was a Monday.

;; * Thirty days has September, April, June and November.
;;   All the rest have thirty-one, Saving February alone,
;;   Which has twenty-eight, rain or shine.
;;   And on leap years, twenty-nine.

;; * A leap year occurs on any year evenly divisible by 4, but not 
;;   on a century unless it is divisible by 400.

;; How many Sundays fell on the first of the month during the 
;; twentieth century (1 Jan 1901 to 31 Dec 2000)?
#lang racket

(define (leap? year)
  (if (zero? (modulo year 100))
      (zero? (modulo year 400))
      (zero? (modulo year 4))))

(define (month-days month year)
  (and (= 2 month) 
       (leap? year) 29)
       (vector-ref #(0 31 28 31 30 31 30 31 31 30 31 30 31) month))

(define result 0)

;; 1900-2000, month, day...
(do ([weekday 1] [year 1900 (+ year 1)]) ([> year 2000])
  (do ([month 1 (+ month 1)]) ([> month 12]) 
    (do ([day 1 (+ day 1)]) ([> day (month-days month year)])

      ;; sunday 1st?
      (and (> year 1900) (= day 1) (= weekday 7)
        (set! result (+ 1 result)))

      ;; until next sunday
      (set! weekday (if (= weekday 7) 1 (+ weekday 1))))))

(printf "Euler 019: ~a \n" result)

