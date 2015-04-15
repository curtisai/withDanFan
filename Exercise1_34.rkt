#lang racket
(require racket/trace)

(define (f g)
  (g 2))

(trace f)

;The interpreter will thow an error since 2 is not a procedure
;(f f)==>(f 2)==>(2 2)  then  error.