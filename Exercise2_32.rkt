#lang racket
(require racket/trace)

(define (subsets s)
  (define (noIdea x)
  (cons (car s) x))
  (trace noIdea)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map noIdea rest)))))



(trace subsets)


(subsets (list 1 2 3))