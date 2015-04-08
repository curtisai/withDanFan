#lang racket
(require racket/trace)

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))


(define (multi a b)
  (if (= b 0)
      0
      (cond ((even? b) (* 2 (multi a (/ b 2))))
            (else (+ a (multi a (- b 1)))))))



(trace multi)