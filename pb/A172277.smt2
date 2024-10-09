;; sequence(s): A172277
;; terms: 0 1 3 5 7 9 11 13 14 16 18 20 22 24 26 28 29 31 33 35
;; small program: (((if x <= 0 then 1 else x) - 1) - (((x div 2) div 2) div 2)) + x
;; fast program: (((if x <= 0 then 1 else x) - 1) - (x div (2 * (2 + 2)))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (- (ite (<= x 0) 1 x) 1) (divf (divf (divf x 2) 2) 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (- (ite (<= x 0) 1 x) 1) (divf x (* 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
