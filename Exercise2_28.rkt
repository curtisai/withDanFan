#lang racket

(require racket/trace)

(define (fringe tree)
  (if (null? tree)
      '()
      (if (not (pair? tree))
           (list tree)
           (append (fringe (car tree)) (fringe (cdr tree)))))) 

(define x (list (list 1 2)(list 3 4)))

(trace fringe)
(fringe x)
(fringe (list x x))