;; sequence(s): A248227
;; terms: 1 1 2 3 3 4 5 6 6 7 8 8 9 10 10 11 12 12 13 14
;; small program: ((((x - ((0 - x) div (2 + (2 + 2)))) div (1 + 2)) + x) div 2) + 1
;; fast program: (((2 * (x + x)) - ((0 - x) div (2 + (2 + 2)))) div (2 + (2 + 2))) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (divf (- x (divf (- 0 x) (+ 2 (+ 2 2)))) (+ 1 2)) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- (* 2 (+ x x)) (divf (- 0 x) (+ 2 (+ 2 2)))) (+ 2 (+ 2 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
