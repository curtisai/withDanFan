#lang racket
(require racket/trace)

(define (double term)
  (lambda(x)(term (term x))))

(define (inc x)
  (+ 1 x))

(trace inc)

(((double (double double)) inc ) 5)