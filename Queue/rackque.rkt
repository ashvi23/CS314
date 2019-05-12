#lang racket

(define my-q '())

(define (printq)
(define (printhelper)
  (if (empty?) '()
      (display my-q)))
  (printhelper))

(define (dequeue)
 (define (dequeue-helper) ;;anonymous function?
   (if (null? my-q) (set!  my-q '());;if list is null, set stack equal to empty list
   (set!  my-q (reverse (cdr (reverse my-q)))));;else remove last item from list
   )
 (dequeue-helper))
;; if cdr of q is null, return empty list, else set stack equal to cons car of stack and dequ of cdr of stack together
(define (enqueue x)
(define (enqueue-helper x)
  (set!  my-q (cons x  my-q)))
(enqueue-helper x))

(define (empty?)
 (define (empty-helper  my-q)
   (if (null?  my-q) #t
      #f))
  (empty-helper my-q))