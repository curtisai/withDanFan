#lang racket
;Define a procedure that takes three numbers as 
;arguments and returns the sum of the squares of
;the two larger numbers.

(define (largest-two-square-sum x y z)
  (if (= x (larger x y))
      (sum-of-squares x (larger y z))
      (sum-of-squares y (larger x z))
      )
  )

(define (larger x y)
  (if (> x y) x y)
  )

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square x)
  (* x x)
  )