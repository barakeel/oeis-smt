;; sequence(s): A28903-A81599
;; terms: 0 1 2 3 4 5 6 7 8 9 8 9 10 11 12 13 14 15 16 17
;; small program: x - (2 * ((x div 2) div (1 + (2 + 2))))
;; fast program: x - (2 * (x div (2 + (2 * (2 + 2)))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- x (* 2 (divf (divf x 2) (+ 1 (+ 2 2))))))))
(assert (forall ((x Int)) (= (fast x) (- x (* 2 (divf x (+ 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
