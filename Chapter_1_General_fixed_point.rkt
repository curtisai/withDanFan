#lang racket

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

(define (fixed_point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (if (close-enough? guess ((lambda(x)(f x)) guess))
        ((lambda(x)(f x)) guess)
        (try ((lambda(x)(f x)) guess))))
  (try first-guess))

;example

(define (average-damp f)
  (lambda (x) (/ 2 (+ x (f x)))))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y)(/ x y))
                            average-damp
                            1.0))
(define (sqrt_two x)
  (fixed-point-of-transform (lambda(y)(- (square y) x))
                            newton-transform
                            1.0))

(define (square x)
  (* x x))


(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))


(define dx 0.000001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)((deriv g) x)))))