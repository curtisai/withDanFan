#lang racket
(require racket/trace)

;Derivative

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.00001)

(define (fixed_point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1  v2)) tolerance))
  (define (try guess)
    (if (close-enough? guess ((lambda(x)(f x)) guess))
        ((lambda(x)(f x)) guess)
        (try ((lambda(x)(f x)) guess))))
  (try first-guess))

(define (sqrt x)
  (newton-method (lambda (y) (- (square y) x))
                  1.0))

(define (square x)
  (* x x))