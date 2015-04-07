#lang racket
(require racket/trace)

; A function f is defined by the rule that
; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.
; Write a procedure that computes f by means of a recursive process. 
; Write a procedure that computes f by means of an iterative process.

(define (recursive_f n)
  (cond ((< n 3) n)
        (else (+ (recursive_f (- n 1)) 
                 (* 2 (recursive_f (- n 2))) 
                 (* 3 (recursive_f (- n 3)))))))

(define (iterative_f count)
  (f_iter 0 1 2 count))

(define (f_iter first second third count)
  (cond ((= count 2) third)
        (else (f_iter second third (+ third (* 2 second) (* 3 first)) (- count 1)))))

(trace recursive_f)
(trace f_iter)