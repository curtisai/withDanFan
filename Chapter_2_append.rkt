#lang racket
(require racket/trace)

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)(append (cdr list1) list2))))

(define one(list 1 2 3 4 5))
(define two(list 6 7 8 9 0))
(trace append)

#|

> (append one two)
>(append '(1 2 3 4 5) '(6 7 8 9 0))
> (append '(2 3 4 5) '(6 7 8 9 0))
> >(append '(3 4 5) '(6 7 8 9 0))
> > (append '(4 5) '(6 7 8 9 0))
> > >(append '(5) '(6 7 8 9 0))
> > > (append '() '(6 7 8 9 0))
< < < '(6 7 8 9 0)
< < <'(5 6 7 8 9 0)
< < '(4 5 6 7 8 9 0)
< <'(3 4 5 6 7 8 9 0)
< '(2 3 4 5 6 7 8 9 0)
<'(1 2 3 4 5 6 7 8 9 0)
'(1 2 3 4 5 6 7 8 9 0)
> (cons one two)
'((1 2 3 4 5) 6 7 8 9 0)

|#