#lang racket
(require racket/trace)

(define dx 0.000001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)((deriv g) x)))))

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess))) 
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;following function is not necessary
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

;x^3+ax^2+bx+c=0

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


(define (cubic a b c)
  (lambda(x)(+ (* x x x) (* a x x) (* b x) c)))

