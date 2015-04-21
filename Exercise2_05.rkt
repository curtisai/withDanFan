#lang racket
(require racket/trace)

(define (exp base n)
  (define (iter x result)
    (if (= 0 x)
        result
        (iter (- x 1) (* base result))))
  (iter n 1))

(define (count-0-remainder-divisions n divisor)
  (define (iter try-exp)
    (if (= 0 (remainder n (exp divisor try-exp)))
        (iter (+ try-exp 1))
        (- try-exp 1)))
  (iter 1))

(define (cons a b)
  (* (exp 2 a) (exp 3 b)))

(define (car x)
  (count-0-remainder-divisions x 2))
(define (cdr x)
  (count-0-remainder-divisions x 3))