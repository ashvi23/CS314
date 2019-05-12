#lang racket

(define BST '())

(define (insert n)
  (cond
    ((null? BST)
     (set! BST (list '() n '())))
    ((< n (cadr BST))
     (set! BST (list (insert-helper (car BST) n) (cadr BST) (caddr BST))))
    ((> n (cadr BST))
     (set! BST (list (car BST) (cadr BST) (insert-helper (caddr BST) n))))
    (else BST))
  )

(define (insert-helper temp n)
    (cond
    ((null? temp)
     (list empty n empty))
    ((< n (cadr temp))
     (list (insert-helper (car temp) n) (cadr temp) (caddr temp)))
    ((> n (cadr temp))
     (list (car temp) (cadr temp) (insert-helper (caddr temp) n)))
    (else temp))
  )