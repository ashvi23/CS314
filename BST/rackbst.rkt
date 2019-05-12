#lang racket
(require racket/trace)

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

(define (remove val)
  (define (searchbst tempbst val pos)
   (cond
      [(null? tempbst) (tempbst)]
      [(> val (cadr tempbst)) (list (car tempbst) (cadr tempbst) (searchbst (caddr tempbst) val 1))]
      [(< val (cadr tempbst)) (list (searchbst (car tempbst) val -1) (cadr tempbst) (caddr tempbst))]
      [(= val (cadr tempbst)) (cond
                                [(and (null? (car tempbst)) (not (null? (caddr tempbst)))) (caddr tempbst)]
                                [(and (null? (caddr tempbst)) (not (null? (car tempbst)))) (car tempbst)]
                                [(and (null? (caddr tempbst)) (null? (car tempbst))) '()];; if neither child exists
                                [(and (not (null? (caddr tempbst))) (not(null? (car tempbst)))) (cond ;;if both children exist: 1 for right child, -1 for left child, 0 for root
                                                                                                  [(= pos 1) (list (car tempbst) (retminval (caddr tempbst)) (removeval (caddr tempbst) -1))]
                                                                                                  [(= pos -1) (list (removeval (car tempbst) 1) (retmaxval (car tempbst)) (caddr tempbst))]
                                                                                                  [(= pos 0) (list (car tempbst) (retminval (caddr tempbst)) (removeval (caddr tempbst) -1))])
                                                                                                ])
                                                                                                ] 
                   )
    )
    (set! BST (searchbst BST val 0))
  )

(define (retminval tempbst)
  (cond
    [(null? (car tempbst)) (cadr tempbst)]
    [else (retminval (car tempbst))]))

(define (retmaxval tempbst)
  (cond
    [(null? (caddr tempbst)) (cadr tempbst)]
    [else (retmaxval (caddr tempbst))]))

(define (removeval tempbst min_max)
  (cond
    [(= min_max 1) (cond ;;going right
                      [(null? (caddr tempbst)) (car tempbst)]
                      [else (list (car tempbst) (cadr tempbst) (removeval (caddr tempbst) 1))])]
     [(= min_max -1) (cond ;;going left
                      [(null? (car tempbst)) (caddr tempbst)]
                      [else (list (removeval (car tempbst) -1) (cadr tempbst) (caddr tempbst))])])
  )