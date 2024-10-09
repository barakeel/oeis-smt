;; sequence(s): A330179
;; terms: 4 9 13 18 22 27 33 37 42 46 51 55 61 66 70 75 79 84 90 94
;; small program: ((((1 + 2) * (1 + x)) + ((x div 2) div (1 + 2))) * (1 + 2)) div 2
;; fast program: ((((1 + 2) * (1 + x)) + (x div (2 + (2 + 2)))) * (1 + 2)) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (* (+ (* (+ 1 2) (+ 1 x)) (divf (divf x 2) (+ 1 2))) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ (* (+ 1 2) (+ 1 x)) (divf x (+ 2 (+ 2 2)))) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
