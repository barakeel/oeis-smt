;; sequence(s): A122461
;; terms: 0 0 0 0 2 2 2 2 4 4 4 4 6 6 6 6 8 8 8 8
;; small program: 2 * ((x div 2) div 2)
;; fast program: 2 * (x div (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* 2 (divf (divf x 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (* 2 (divf x (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
