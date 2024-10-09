;; sequence(s): A277093
;; terms: 1 7 13 19 26 32 38 44 45 51 57 63 70 76 82 88 89 95 101 107
;; small program: (1 + ((x - (((x div 2) div 2) div 2)) * (2 + (2 + 2)))) + ((x div 2) div 2)
;; fast program: (1 + ((x - (x div (2 * (2 + 2)))) * (2 + (2 + 2)))) + (x div (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (* (- x (divf (divf (divf x 2) 2) 2)) (+ 2 (+ 2 2)))) (divf (divf x 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (* (- x (divf x (* 2 (+ 2 2)))) (+ 2 (+ 2 2)))) (divf x (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
