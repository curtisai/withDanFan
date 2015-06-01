#lang racket

(define (last-pair items)
  (define (last-pair-iter items value)
    (if (null? items)
        value
        (last-pair-iter (cdr items) (car items))))
  (last-pair-iter items null))


(define (last-pair-r items)
  (let ((rest (cdr items)))
    (if (null? rest)
        items
        (last-pair rest))))