#lang racket
(require racket/trace)

(define (map p sequence)
  (accumulate (lambda (x y)(p x.y) nil sequence)))

(define (append seq1 seq2)
  (accumulate cons 