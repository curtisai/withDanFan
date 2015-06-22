#lang racket
(require racket/trace)


(define (for-each proc list)
  (let ((items-cdr (cdr list)))
    (proc (car list))
    (if (not (null? items-cdr))
        (for-each proc items-cdr)
        true)))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
