;; sequence(s): A139179
;; terms: 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 14 15 16 17
;; small program: ((x * x) - (((x div 2) div 2) div 2)) div (1 + x)
;; fast program: (if x <= 0 then 1 else x) - (if ((2 * (2 * (2 + 2))) - x) <= 0 then 2 else 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (- (* x x) (divf (divf (divf x 2) 2) 2)) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (ite (<= x 0) 1 x) (ite (<= (- (* 2 (* 2 (+ 2 2))) x) 0) 2 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
