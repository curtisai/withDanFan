#lang racket
(require racket/trace)

(define (accumulate-gen combiner filter null-value term a next b)
  (if (> a b)
      null-value
      (cond ((filter a)(combiner (term a) (accumulate-gen combiner filter null-value term (next a) next b)))
             (else (accumulate-gen combiner filter null-value term (next a) next b)))))

(define (accumulate-gen-iter combiner filter null-value term a next b)
  (define (acc-gen-iter a result)
    (if (> a b)
        result
        (cond ((filter a)(acc-gen-iter (next a) (combiner (term a) result)))
              (else (acc-gen-iter (next a) result)))))
  (acc-gen-iter a null-value))




;the sum of the squares of the prime numbers in the interval a to b
(define (square-sum-of-primes a b)
  (accumulate-gen + prime? 0 square a inc b))

(define (inc n)
  (+ n 1))









;*****************************************************
;prime test
(define (prime? n)
  (miller-rabin-test (- n 1) n))

 (define (miller-rabin-test a n) 
   (cond ((= a 0) true) 
         ; expmod is congruent to 1 modulo n 
         ((= (expmod a (- n 1) n) 1) (miller-rabin-test (- a 1) n)) 
         (else false))) 
  
 (define (expmod base exp m) 
   (cond ((= exp 0) 1) 
         ((even? exp) 
          (let ((x (expmod base (/ exp 2) m))) 
            (if (non-trivial-sqrt? x m) 0 (remainder (square x) m)))) 
         (else 
          (remainder (* base (expmod base (- exp 1) m)) 
                     m)))) 

(define (square n)
  (* n n))

 (define (non-trivial-sqrt? n m) 
   (cond ((= n 1) false) 
         ((= n (- m 1)) false) 
         ; book reads: whose square is equal to 1 modulo n 
         ; however, what was meant is square is congruent 1 modulo n 
         (else (= (remainder (square n) m) 1)))) 
  