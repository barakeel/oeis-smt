;; sequence(s): A64679
;; terms: 1 3 5 7 9 11 13 15 17 19 21 23 25 26 28 30 32 34 36 38
;; small program: ((1 - ((x - (((x div 2) div 2) div 2)) div (2 * (2 + (2 + 2))))) + x) + x
;; fast program: ((1 - ((x - (x div (2 * (2 + 2)))) div (2 * (2 + (2 + 2))))) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (- 1 (divf (- x (divf (divf (divf x 2) 2) 2)) (* 2 (+ 2 (+ 2 2))))) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- 1 (divf (- x (divf x (* 2 (+ 2 2)))) (* 2 (+ 2 (+ 2 2))))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
