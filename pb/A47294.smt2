;; sequence(s): A47294
;; terms: 1 2 4 6 8 9 11 13 15 16 18 20 22 23 25 27 29 30 32 34
;; small program: 1 + ((((x div 2) + x) div 2) + x)
;; fast program: (x - ((x - 1) div (2 + 2))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (divf (+ (divf x 2) x) 2) x)))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (divf (- x 1) (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
