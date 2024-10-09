;; sequence(s): A110117
;; terms: 3 6 9 12 15 18 22 25 28 31 34 37 40 44 47 50 53 56 59 62
;; small program: ((1 + 2) * (1 + x)) + ((x - (((x div 2) div 2) div 2)) div (2 + (2 + 2)))
;; fast program: ((1 + 2) * (1 + x)) + ((x - (x div (2 * (2 + 2)))) div (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 2) (+ 1 x)) (divf (- x (divf (divf (divf x 2) 2) 2)) (+ 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (+ 1 x)) (divf (- x (divf x (* 2 (+ 2 2)))) (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
