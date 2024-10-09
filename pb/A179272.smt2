;; sequence(s): A179272
;; terms: ~1 ~2 ~1 ~1 1 2 5 7 11 14 19 23 29 34 41 47 55 62 71 79
;; small program: ((((x * x) div 2) - x) div 2) - 1
;; fast program: (((x - 2) * x) div (2 + 2)) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (divf (- (divf (* x x) 2) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (- (divf (* (- x 2) x) (+ 2 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
