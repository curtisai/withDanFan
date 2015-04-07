#lang racket
(require racket/trace)

(define (cubrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess .001)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x )
  (* x x))

(trace good-enough?)