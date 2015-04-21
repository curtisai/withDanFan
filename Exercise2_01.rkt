#lang racket
(require racket/trace)
(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (if (> 0 (* n d))
        (cons (- 0 (/ (abs n) g)) (/ (abs d) g))
        (cons (/ (abs n) g) (/ (abs d) g)))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))
      