#lang racket
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))



(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p)))

(define (make-segment pA pB)
  (cons pA pB))

(define (start-point segment)
  (car segment))

(define (end-point segment)
  (cdr segment))

(define (midpoint-segment segment)
  (make-point (/ (+ (x-point (start-point segment))
                    (x-point (end-point segment)))
                 2)
              (/ (+ (y-point (start-point segment))
                    (y-point (end-point segment)))
                 2)))