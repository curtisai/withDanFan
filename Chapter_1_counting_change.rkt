#lang racket
(require racket/trace)
;The problem is:
;How many different ways can we make change of $ 1.00, given half-dollars,
;quarters, dimes, nikels, and pennies?


;Solution:

;The ways to make change can be divided into two groups: Those that 
; do not use any of the first kind of coin, and those that do.

;The number of ways to change amount A using n kinds of coins 
;equals:

;1. The number of ways to change amount A using all but the first kind of coins, plus

;2. The number of ways to change amount A-D using all kinds of coins, where D is the
;denomination of the first kind of coin.(I think A-D means at least you need to use D once)


;Thus, we can recursively reduce the problem of changing a given amount
;to the problem of changing smaller amounts using fewer kinds of coin
;
;We come up with following degenerate cases:

; *if A is exactly 0, we should count that as 1 way to make change
; *if A is less than 0, we should count that as 0 ways to make change
; *if n is 0, we should count that as 0 wasy to make change.

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(trace cc)
