;; sequence(s): A198442
;; terms: 0 0 2 3 6 8 12 15 20 24 30 35 42 48 56 63 72 80 90 99
;; small program: (((x * x) div 2) + x) div 2
;; fast program: ((2 + x) * x) div (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ (divf (* x x) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ 2 x) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
