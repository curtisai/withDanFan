#lang racket
(require racket/trace)

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (make-line-segment startP endP)
  (cons startP endP))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (start-segment line)
  (car line))
(define (end-segment line)
  (cdr line))
(define (midpoint-segment line)
  (make-point (/ 2 (+ (x-point (start-segment line)) (x-point (end-segment line))))
              (/ 2 (+ (y-point (start-segment line)) (y-point (end-segment line))))))