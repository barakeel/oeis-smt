;; sequence(s): A86790
;; terms: 1 2 4 8 11 15 19 23 26 30 34 38 42 46 50 54 58 62 66 70
;; small program: (1 + (2 * (2 * ((x * x) - (x div 2))))) div (1 + x)
;; fast program: (2 + (2 * ((2 * (x * x)) - x))) div ((if x <= 0 then 2 else 1) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ 1 (* 2 (* 2 (- (* x x) (divf x 2))))) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ 2 (* 2 (- (* 2 (* x x)) x))) (+ (ite (<= x 0) 2 1) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
