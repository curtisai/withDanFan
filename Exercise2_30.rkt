#lang racket
(require racket/trace)

(define (square x)
  (* x x x))

(define (square-tree tree)
  (map (lambda(sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))

(define (square-tree-r tree)
  (cond ((null? tree) '())
        ((not (pair? tree))(square tree))
        (else (cons (square-tree-r (car tree) )
                    (square-tree-r (cdr tree) )))))

(square-tree-r (list 1
                   (list 2 
                         (list 3 4) 
                         5)
                   (list 6 7)))