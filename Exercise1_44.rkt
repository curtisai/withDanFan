#lang racket
(require racket/trace)

(define (smoothing f)
  (define dx 0.0001)
  (lambda(x)(/ 3 (+ (f (+ x dx)) (f x) (f (- x dx))))))

(define (repeated term count)
  (if (= count 0)
      (lambda(x) x)
      (compose term (repeated term (- count 1)))))

(define (n-fold-smoothing f n)
  (repeated (smoothing f) n))

(define (compose f g)
  (lambda(x)(f (g x))))