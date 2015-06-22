#lang racket
(require racket/trace)

#|(define nil '())

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (same-parity x . y)
  (if (null? y)
      nil
      (if (= 0 (/ (- x (car y)) 2))
          (cons x (same-parity (car y) (cdr y)))
          (same-parity x  (cdr y)))))

(trace same-parity)

(same-parity 1 2 3 4 5 6)
|#
;********************************
#|
(define (same-parity first . rest)
  (define (same-parity-iter source dist remainder-val)
    (if (null? source)
        dist
        (same-parity-iter (cdr source)
                          (if (= (remainder (car source) 2) remainder-val)
                              (append dist (list (car source)))
                              dist)
                          remainder-val)))
  (trace same-parity-iter)
  (same-parity-iter rest (list first)(remainder first 2)))
|#

(define (same-parity first . rest)
  (let ((yes? (if (even? first)
                  even?
                  odd?)))
   
    (define (iter items result)
      (if (null? items)
          (reverse result)
          (iter (cdr items) (if (yes? (car items))
                                (cons (car items) result)
                                result))))
    (iter rest (list first))))


(same-parity 1 2 3 4 5 6)

