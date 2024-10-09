;; sequence(s): A8747
;; terms: 1 1 2 3 5 6 9 11 14 17 21 24 29 33 38 43 49 54 61 67
;; small program: 1 + ((((x * x) div 2) + x) div (1 + 2))
;; fast program: 1 + (((2 + x) * x) div (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (divf (+ (divf (* x x) 2) x) (+ 1 2))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (divf (* (+ 2 x) x) (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
