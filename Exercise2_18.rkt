#lang racket
(require racket/trace)

(define (append list1 item)
  (if (null? list1)
      (list item)
      (cons (car list1)(append (cdr list1) item))))

(define (reverse items)
  (if (null? items)
      null
      (append  (reverse (cdr items))(car items))))

(define nil '())

(define (reverse-i items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (car items) result))))
  (trace iter)
  (iter items nil))

(define one (list 1 2 3 4 5 6))
(trace reverse)
(trace append)
(trace reverse-i)