#lang racket
(require racket/trace)

(define (repeated term count)
  (if (= count 0)
      (lambda(x) x)
      (compose term (repeated term (- count 1)))))

(define (compose f g)
  (lambda(x) (f(g x))))

(define (square x)
  (* x x))


(trace repeated)