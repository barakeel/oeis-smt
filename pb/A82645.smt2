;; sequence(s): A82645
;; terms: ~1 ~1 1 4 8 12 18 25 33 41 51 62 74 86 100 115 131 147 165 184
;; small program: (((x * x) + (x div 2)) div 2) - 1
;; fast program: (((2 * (x * x)) + x) div (2 + 2)) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (divf (+ (* x x) (divf x 2)) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (- (divf (+ (* 2 (* x x)) x) (+ 2 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
