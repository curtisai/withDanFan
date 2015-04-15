#lang racket
(require racket/trace)



;A let expression is simply syntactic
;sugar for the underlying lambda application

;Let allows one to bind variables as locally as possible
(+ (let ((x 3))
     (+ x (* x 10)))
   x)
;Thus, the evaluation result of above expression is 38
; if the value of x is 5.

;The varibales' values are computed outside the let
;
;For example, if the value of x is 2

(let ((x 3)
      (y (+ x 2)))
  (* x y))
;The result of expression above will be 12, because it equals to

((lambda (a b)(* a b)) 3 (+ x 2))
                                          