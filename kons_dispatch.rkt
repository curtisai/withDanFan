#lang racket
(define (kons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 --cons" m))))
  dispatch)

(define (kar z)
  (z 0))

(define (kdr z)
  (z 1))