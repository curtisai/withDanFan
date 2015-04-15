#lang racket
(require racket/trace)

;sum all integers from a through b
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

;sum all cubes from a through b
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))
(define (cube x)
  (* x x x))


(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))(pi-sum (+ a 4) b))))

(trace pi-sum)
(trace sum-integers)
(trace sum-cubes)

;Just like what we do in math--the sigma notation, we
;could also apply something similar.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;With this template, we could simply rewrite the sum-cube 
;in a different manner

(define (inc n) (+ n 1))
(define (new-sum-cubes a b)
  (sum cube a inc b))
;A new sum-integers

(define (identity x) x)
(define (new-sum-integers a b)
  (sum identity a inc b))

;A new pi-sum

(define (new-pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(trace sum)

;Further more, we could approximatedly calculate
;the definite integeral of a function f between the
;limits a and b

(define (integeral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

