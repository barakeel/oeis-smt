;; sequence(s): A165190
;; terms: 1 0 0 0 1 1 0 0 1 1 1 0 1 1 1 1 1 1 1 1
;; small program: ((x div 2) div 2) - ((x - 1) div (1 + (2 + 2)))
;; fast program: (x div (2 + 2)) - ((x - 1) div (1 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (divf (divf x 2) 2) (divf (- x 1) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (- (divf x (+ 2 2)) (divf (- x 1) (+ 1 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
