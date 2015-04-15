#lang racket
(require racket/trace)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (pi-term n)
  (cond ((even? n)(/ n (+ n 1)))
        (else (/ (+ n 1) n))))

(define (pi-calculat n)
  (* 4 (product-iter pi-term 2.0 inc (- n 1))))

(define (iter-fact n)
  (product-iter self 1 inc n))

(define (factorial n)
  (product self 1 inc n))

(define (self n)
  n)

(define (inc n)
  (+ n 1))

(trace product)
(trace product-iter)
