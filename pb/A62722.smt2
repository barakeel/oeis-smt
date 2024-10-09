;; sequence(s): A62722
;; terms: 0 0 1 1 2 2 4 6 6 6 12 12 12 15 20 20 24 24 30 35
;; small program: ((2 + x) div (1 + 2)) * ((1 + (x div 2)) div 2)
;; fast program: ((2 + x) div (1 + 2)) * ((2 + x) div (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (divf (+ 2 x) (+ 1 2)) (divf (+ 1 (divf x 2)) 2)))))
(assert (forall ((x Int)) (= (fast x) (* (divf (+ 2 x) (+ 1 2)) (divf (+ 2 x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
