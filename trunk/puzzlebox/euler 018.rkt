
;; Grazl.
;; Public domain.

;; By starting at the top of the triangle below and moving to adjacent
;; numbers on the row below, the maximum total from top to bottom is 23.

;; That is, 3 + 7 + 4 + 9 = 23.
;; Find the maximum total from top to bottom of the triangle below.
#lang racket

(define triangle
  ;; blame immutable literal vectors and the fact I don't want
  ;; to put (vector ...) in front of each line.
  (vector-map list->vector #(
                              (75)  
                            (95  64)
                          (17  47  82)
                        (18  35  87  10)
                      (20  04  82  47  65)
                    (19  01  23  75  03  34)
                  (88  02  77  73  07  63  67)
                (99  65  04  28  06  16  70  92)
              (41  41  26  56  83  40  80  70  33)
            (41  48  72  33  47  32  37  16  94  29)
          (53  71  44  65  25  43  91  52  97  51  14)
        (70  11  33  28  77  73  17  78  39  68  17  57)
      (91  71  52  38  17  14  91  43  58  50  27  29  48)
    (63  66  04  68  89  53  67  30  73  16  69  87  40  31)
  (04  62  98  27  23  09  70  98  73  93  38  53  60  04  23))))

(define (get-item row col) 
  (vector-ref (vector-ref triangle row) col))

(define (set-item row col value) 
  (vector-set! (vector-ref triangle row) col value))

(for ([row (in-range 1 15)])
  (for ([col (in-range 1 (vector-length (vector-ref triangle row)))])

     ;; first? previous col + current
     (if (zero? col)
       (set-item row col
                 (+ (get-item row col) 
                    (get-item (- row 1) col)))

       ;; last? previous col - 1 + current
       (if (= col (- (vector-length (vector-ref triangle row)) 1))
         (set-item row col
                   (+ (get-item row col) (get-item (- row 1) (- col 1))))

         ;; otherwise both - 1
         (set-item row col
           (let ([this-item (get-item row col)])
             (max (+ this-item (get-item (- row 1) col))
                  (+ this-item (get-item (- row 1) (- col 1))))))))))

;; largest path is now in the last line:
(printf "Euler 018: ~a \n"
  (apply max (vector->list (vector-ref triangle 14))))

