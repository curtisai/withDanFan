#lang racket
(require racket/trace)

(define tolerance 0.000001)

(define (average-damp f)
  (lambda(x)(/ 2.0 (+ x (f x)))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda(x)(f (g x))))

(define (repeated term count)
  (if (= count 0)
      (lambda(x) x)
      (lambda(x)(term ((repeated term (- count 1)) x)))))
      ;(compose term (repeated term (- count 1)))))

(define (get-max-pow n)
  (define (iter p r)
    (if (< (- n r) 0)
        (- p 1)
        (iter (+ p 1) (* r 2))))
  (iter 1 2))

(define (pow b p)
  (define (even? x)
    (= (remainder x 2) 0))
  (define (square x)
    (* x x))
  (define (iter res a n)
    (if (= n 0)
        res
        (if (even? n)
            (iter res (square a) (/ n 2))
            (iter (* res a) a (- n 1)))))
  (iter 1 b p))

(define (nth-root n x)
  (fixed-point ((repeated average-damp (get-max-pow n))
                (lambda(y)(/ x (pow y (- n 1))))) 1.0))


