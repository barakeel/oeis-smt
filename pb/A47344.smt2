;; sequence(s): A47344
;; terms: 0 1 3 4 7 8 10 11 14 15 17 18 21 22 24 25 28 29 31 32
;; small program: (((x div 2) div 2) + (x div 2)) + x
;; fast program: ((x div 2) + (x div (2 + 2))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (divf x 2) 2) (divf x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf x 2) (divf x (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
