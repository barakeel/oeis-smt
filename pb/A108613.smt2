;; sequence(s): A108613
;; terms: 0 0 0 0 0 6 7 8 9 10 22 24 26 28 30 48 51 54 57 60
;; small program: (1 + x) * ((x - ((x div 2) div 2)) div (2 + 2))
;; fast program: (1 + x) * ((x - (x div (2 + 2))) div (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (divf (- x (divf (divf x 2) 2)) (+ 2 2))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 x) (divf (- x (divf x (+ 2 2))) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
