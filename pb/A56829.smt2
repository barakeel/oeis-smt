;; sequence(s): A56829
;; terms: 0 0 1 2 3 4 6 8 11 14 17 20 24 28 33 38 43 48 54 60
;; small program: (1 + ((x * x) div (1 + 2))) div 2
;; fast program: 1 + (((x * x) - 2) div (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ 1 (divf (* x x) (+ 1 2))) 2))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (divf (- (* x x) 2) (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
