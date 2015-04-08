#lang racket
(require racket/trace)

(define (fast_expt b n)
  (cond ((= n 0) 1)
        ((= n 1) b)
        (else (fast_iter b (- n 1) b))))

(define (fast_iter base count result)
  (cond ((= count 1) result)
        ((even? count) (fast_iter base (/ count 2) (square result)))
        (else (fast_iter base (- count 1) (*  base result)))))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n)(iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))

(trace fast_iter)