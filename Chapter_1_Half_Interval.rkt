#lang racket
(require racket/trace)

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (lamSearch f neg-point pos-point)
  ((lambda (midpoint)
     (if (close-enough? neg-point pos-point)
         midpoint
         ((lambda (test-value)(cond ((positive? test-value) (lamSearch f neg-point midpoint))
                                    ((negative? test-value) (lamSearch f midpoint pos-point))
                                    (else midpoint))) (f midpoint))))
   (average neg-point pos-point)))

(define (average a b)
  (/ (+ a b) 2.0))

(define (close-enough? a b)
  (< (abs (- a b)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (lamSearch f a b))
          ((and (negative? b-value) (positive? a-value))
           (lamSearch f b a))
          (else
(error "Values are not of opposite sign" a b)))))

(trace search)
(trace lamSearch)