#lang racket
(require racket/trace)
(define (scale-tree tree factor)
  (cond ((null? tree) '())
        ((not (pair? tree))(* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))


(trace scale-tree)


(scale-tree (list 1 (list 2(list 3 4) 5)(list 6 7))
            10)

;*******************************************************88

(define (scale-tree-2 tree factor)
  (map (lambda(sub-tree)
         (if (pair? sub-tree)
             (scale-tree-2 sub-tree factor)
             (* sub-tree factor)))
       tree))
(trace scale-tree-2)
(scale-tree-2 (list 1 (list 2(list 3 4) 5)(list 6 7))
            10)