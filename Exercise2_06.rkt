#lang racket
(require racket/trace)

(define zero (lambda(f) (lambda (x) x)))

#|
(define (zero f)
  (lambda(x) x))
|#

(define (add-1 n)
  (lambda(f) (lambda(x)(f ((n f) x)))))

(define ((add1 n) f)
  (lambda(x) (f ((n f) x))))

(define (((add2 n) f) x)
  (f ((n f) x)))


(define one (lambda(f)(lambda(x)(f x))))
(define two (lambda(f)(lambda(x)(f (f x)))))
(define three (lambda(f)(lambda(x)(f (f (f x))))))

(define (add a b)
  (lambda(f)
    (lambda(x)
      ((a f)((b f) x)))))

(trace add2)