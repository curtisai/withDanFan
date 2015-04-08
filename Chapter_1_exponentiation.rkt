#lang racket
(require racket/trace)

(define (expt_recursive b n)
  (if (= n 0)
      1
      (* b (expt_recursive b (- n 1)))))


(define (expt b n)
  (expt_iter b n 1))

(define (expt_iter b counter product)
  (if (= counter 0)
      product
      (expt_iter b
                 (- counter 1)
                 (* b product))))
;the following algorithm is based on a fact that 
; b^4 * b^4 = b^8
(define (fast_expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast_expt b (/ n 2))))
        (else (* b (fast_expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))
(define (square n)
  (* n n))

(trace expt_iter)
(trace expt_recursive)