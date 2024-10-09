;; sequence(s): A47298
;; terms: 1 3 4 6 8 10 11 13 15 17 18 20 22 24 25 27 29 31 32 34
;; small program: (((2 - (x div 2)) div 2) + x) + x
;; fast program: (x - ((x - 2) div (2 + 2))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (- 2 (divf x 2)) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (divf (- x 2) (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
