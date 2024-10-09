;; sequence(s): A332613
;; terms: 0 1 2 3 4 5 5 6 7 8 9 10 11 12 12 13 14 15
;; small program: ((2 - (x div 2)) div (2 + 2)) + x
;; fast program: x - ((2 + x) div (2 * (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (- 2 (divf x 2)) (+ 2 2)) x))))
(assert (forall ((x Int)) (= (fast x) (- x (divf (+ 2 x) (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
