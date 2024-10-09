;; sequence(s): A82644
;; terms: 0 0 1 3 7 11 16 22 30 38 47 57 69 81 94 108 124 140 157 175
;; small program: (((x * x) - x) + (x div 2)) div 2
;; fast program: ((2 * (x * x)) - x) div (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ (- (* x x) x) (divf x 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (- (* 2 (* x x)) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
