#lang racket
;;(define stack '(0))

#|(define push
  (lambda (val)
    (cons val stack)))

(define pop
   (lambda (stack)
    (cdr stack)))|#

(define my-stack '(1 2 3 4 5 6 7))

(define (printstack)
(define (printhelper  my-stack)
  (if (empty?) '()
      (display my-stack)))
  (printhelper  my-stack))

(define (pop)
 (define (pop-helper my-stack) ;;anonymous function?
  ;;(let ((result (car  my-stack))) ;;let is used to bind variables in local scope
   (set!  my-stack (cdr  my-stack))
 ;; result))
   )
 (pop-helper my-stack))

(define (push x)
(define (push-helper x  my-stack)
  (set!  my-stack (cons x  my-stack)))
(push-helper x my-stack))

(define (empty?)
 (define (empty-helper  my-stack)
   (if (null?  my-stack) #t
      #f))
  (empty-helper my-stack))