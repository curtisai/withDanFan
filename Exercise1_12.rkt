#lang racket
(require racket/trace)

; Write a procedure that computes elements of Pascal's triangle
; by means of a recursive process.

(define (pascal col row)
  (cond ((or (= col 1) (= row 1)) 1)
        (else (+ (pascal (- col 1) row) (pascal col (- row 1))))))

(trace pascal)