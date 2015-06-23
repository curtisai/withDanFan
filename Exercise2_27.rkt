#lang racket

(require racket/trace)



(define (reverse items)
  (define (reverse-iter items result)
    (if (null? items)
        result
        (reverse-iter (cdr items) (cons (car items) result))))
  (reverse-iter items '()))

(define (reverse-r items)
  (if (null? items)
      '()
      (append (reverse-r (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (cond ((null? items)'())
        ((not (list? items)) items)
        (else (append(deep-reverse (cdr items))(list (deep-reverse (car items)))))))
(trace reverse-r)
(trace deep-reverse)

(deep-reverse '(1 2 (3 4)))
(reverse-r (list 1 2 3 4))