#lang racket

(require racket/trace)



(define (reverse items)
  (define (reverse-iter items result)
    (if (null? items)
        result
        (reverse-iter (cdr items) (cons (car items) result))))
  (reverse-iter items '()))

(define (deep-reverse items)
  