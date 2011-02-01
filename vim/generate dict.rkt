
;; Grazl.
;; Public domain.

;; Generates a list of defined symbols in the global
;; environment in PLT Racket to use with Vim
;; dictionaries for autocompletion. 

;; As of Racket 5.0.2 this generates a `racket-dict.vim'
;; file with 1280+ symbols.
#lang racket

(define symbols
  (sort (map symbol->string 
             (namespace-mapped-symbols (make-base-namespace)))
        string<?))

(call-with-output-file* "racket-dict.vim"
  (lambda (out)
    (for-each
      (lambda (symbol) (displayln symbol out)) symbols))
  #:exists 'replace)

