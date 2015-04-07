#lang racket

(require racket/trace)
;Original Newton's Algorithm
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))


(define (newGoodEnough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess .001)))

(trace square)
(trace sqrt)
(trace good-enough?)
(trace improve)
(trace average)
(trace sqrt-iter)