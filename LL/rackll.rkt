#lang racket

(define LL '()) 

(define (add val)
 (set! LL (cons val LL))
   )

(define (remove val)
  (remove val LL))