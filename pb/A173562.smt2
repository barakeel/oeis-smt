;; sequence(s): A173562
;; terms: 0 1 4 9 17 26 37 50 66 83 102 123 147 172 199 228 260 293 328 365
;; small program: (x * x) + ((x div 2) div 2)
;; fast program: (x * x) + (x div (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* x x) (divf (divf x 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* x x) (divf x (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
