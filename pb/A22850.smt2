;; sequence(s): A22850
;; terms: 0 3 5 8 11 13 16 19 21 24 26 29 32 34 37 40 42 45 48 50
;; small program: ((((((2 - (((x div 2) div 2) div 2)) div 2) + x) + x) div (1 + 2)) + x) + x
;; fast program: (((2 + ((2 * (x + x)) - (x div (2 * (2 + 2))))) div (2 + (2 + 2))) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (+ (+ (divf (- 2 (divf (divf (divf x 2) 2) 2)) 2) x) x) (+ 1 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ 2 (- (* 2 (+ x x)) (divf x (* 2 (+ 2 2))))) (+ 2 (+ 2 2))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
