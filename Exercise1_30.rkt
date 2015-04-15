 #lang racket
(require racket/trace)

(define (itersum term a next b) 
 (define (iter a result)
   (if (> a b)
       result
       (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (newSum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))