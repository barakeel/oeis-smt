;; sequence(s): A213908
;; terms: 1 3 5 7 8 10 12 13 15 17 19 20 22 24 25 27 29 31 32 34
;; small program: ((1 - ((((1 + ((x div 2) div 2)) div 2) + x) div (2 + 2))) + x) + x
;; fast program: ((1 - (((((2 + 2) + x) div (2 * (2 + 2))) + x) div (2 + 2))) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (- 1 (divf (+ (divf (+ 1 (divf (divf x 2) 2)) 2) x) (+ 2 2))) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- 1 (divf (+ (divf (+ (+ 2 2) x) (* 2 (+ 2 2))) x) (+ 2 2))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
