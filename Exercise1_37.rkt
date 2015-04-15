#lang racket
(require racket/trace)

(define (cont-frac n d k)
  (if (= 0 k)
      1.0
      (/ n (+ d (cont-frac n d (- k 1))))))

(define (iter-cont-frac n d k)
  (define (iter n d result count)
    (if (> count k)
        result
        (iter n d (/ n (+ d result)) (+ count 1))))
  (iter n d 1.0 1.0))
        

(trace cont-frac)

;******************************************************************************************

(define (cont_frac n d k)
  (if (= 0 k)
      0
      (/ (n k) (+ (d k) (cont_frac n d (- k 1))))))

(define (iter_cont_frac n d k)
  (define (iter n d result count)
    (if (> count k)
        result
        (iter n d (/ (n count) (+ (d count) result)) count)))
  (iter n d 0 k))