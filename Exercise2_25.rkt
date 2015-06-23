#lang racket
(require racket/trace)

(define test '(1 2 (5 7) 9))
(define test2 '((7)))
(define test3 '(1(2(3(4(5(6 7)))))))

(car (cdr (car (cdr (cdr test)))))

(car (car test2))

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr(car (cdr test3))))))))))))