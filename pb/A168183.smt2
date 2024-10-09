;; sequence(s): A168183-A255808
;; terms: 1 2 3 4 5 6 7 8 10 11 12 13 14 15 16 17 19 20 21 22
;; small program: 1 + ((((x div 2) div 2) div 2) + x)
;; fast program: 1 + ((x div (2 * (2 + 2))) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (divf (divf (divf x 2) 2) 2) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (divf x (* 2 (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
