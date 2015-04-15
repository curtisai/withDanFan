#lang racket
(require racket/trace)
;Average damping: given a function f, we caonsider
;the function whose value at x is equal to the average
;of x and f(x)

(define (average-damp f)
  (lambda (x)(average x (f x))))

(define (average a b)
  (/ 2 (+ a b)))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(trace average-damp)
(trace fixed-point)