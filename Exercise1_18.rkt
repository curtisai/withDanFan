#lang racket
(require racket/trace)

(define (multi a b)
  (multi_iter 0 a b))

(define (multi_iter result a b)
  (cond ((= 0 b) result)
        ((even? b) (multi_iter result (* 2 a) (/ b 2)))
        (else (multi_iter (+ result a) a (- b 1)))))

(trace multi_iter)