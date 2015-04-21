#lang racket
(require racket/trace)

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

(define (kons x y)
  (lambda(input)(cond ((= input "car") x)
                     ((= input "cdr") y)
                     (else (error "Argument not car or cdr -- CONS" input)))))

(define (car z)(z 0))
(define (cdr z)(z 1))

(define (kar z)(z "car"))
(define (kdr z)(z "cdr"))

(define (cons2 x y)
  (lambda(m)(m x y)))

(define (car2 z)
  (z (lambda(p q) p)))

(define (cdr2 z)
  (z (lambda(p q) q)))