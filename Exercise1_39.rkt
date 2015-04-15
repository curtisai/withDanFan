#lang racket
(require racket/trace)

(define (cont-frac n d k count)
  (if (= 0 k)
      0
      (/ (n count) (+ (d count) (cont-frac n d (- k 1) (+ count 1))))))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i)
               (- (* i 2) 1))
             k
             1))

(trace cont-frac)