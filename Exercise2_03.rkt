#lang racket
(require racket/trace)
(define (make-point x y)
  (cons x y))

(define (getX point)
  (car point))

(define (make-rect p1 p2)
  (cons p1 p2))

(define (getY point)
  (cdr point))


(define (getP1 rect)
  (car rect))

(define (getP2 rect)
  (cdr rect))

(define (getLength rect)
  (abs (- (getX (getP1 rect)) (getX (getP2 rect)))))

(define (getWidth rect)
  (abs (- (getY (getP1 rect)) (getY (getP2 rect)))))

(define (compute-perimeter rect)
  (* 2 (+ (getLength rect) (getWidth rect))))

(define (compute-area rect)
  (* (getLength rect) (getWidth rect)))