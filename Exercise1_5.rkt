#lang racket
(require racket/trace)
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(trace p)