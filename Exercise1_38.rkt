#lang racket
(require racket/trace)

(define (term d)
  (cond ((= (remainder d 3) 2) (* 2 (/ (+ 1 d) 3)))
        (else 1)))

(define (cont_frac n d k count)
  (if (= 0 k)
      0
      (/ (n count) (+ (d count) (cont_frac n d (- k 1) (+ count 1))))))

;Facing difficults in writting a iterative version
(define (iter_cont_frac n d k)
  (define (iter n d result count)
    (if (> count k)
        result
        (iter n d (/ (n count) (+ (d count) result)) (+ 1 count))))
  (iter n d 0 k))

(cont_frac (lambda(x)1.0)
           term
           100 1)
(iter_cont_frac (lambda(x)1.0)
           term
           100)

(trace cont_frac)