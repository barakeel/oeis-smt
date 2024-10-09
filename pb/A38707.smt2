;; sequence(s): A38707
;; terms: 0 0 2 5 9 13 19 26 34 42 52 63 75 87 101 116 132 148 166 185
;; small program: ((x * x) + (x div 2)) div 2
;; fast program: ((2 * (x * x)) + x) div (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ (* x x) (divf x 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (* 2 (* x x)) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
