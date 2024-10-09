;; sequence(s): A136616
;; terms: 1 3 6 9 11 14 17 19 22 25 28 30 33 36 38 41 44 47 49 52
;; small program: ((((((((2 - ((x div 2) div 2)) div 2) + x) div (if x <= 0 then 1 else 2)) + 1) + x) div 2) + x) + x
;; fast program: ((((2 - ((((1 + (x div (2 + 2))) div 2) + x) div (2 + 2))) + x) + x) - (if x <= 0 then 1 else 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (+ (+ (divf (+ (divf (- 2 (divf (divf x 2) 2)) 2) x) (ite (<= x 0) 1 2)) 1) x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (+ (+ (- 2 (divf (+ (divf (+ 1 (divf x (+ 2 2))) 2) x) (+ 2 2))) x) x) (ite (<= x 0) 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
