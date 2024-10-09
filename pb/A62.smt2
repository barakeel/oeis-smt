;; sequence(s): A62
;; terms: 1 2 4 5 6 8 9 11 12 13 15 16 18 19 20 22 23 25 26 27
;; small program: (((2 - ((x - (x div (1 + (2 + (2 + 2))))) div (2 + 2))) + x) div 2) + x
;; fast program: (((x - (((1 + 2) * (1 + x)) div ((((2 + 2) + 2) * 2) + 2))) div 2) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (- 2 (divf (- x (divf x (+ 1 (+ 2 (+ 2 2))))) (+ 2 2))) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (- x (divf (* (+ 1 2) (+ 1 x)) (+ (* (+ (+ 2 2) 2) 2) 2))) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
