;; sequence(s): A287864
;; terms: 1 1 1 2 2 3 3 4 4 5 5 6 6 6 7 7 8 8 9 9
;; small program: (1 + (((2 - (x div (2 + 2))) div (2 + 2)) + x)) div (if x <= 0 then 1 else 2)
;; fast program: ((1 - ((2 + (2 + x)) div (2 * (2 * (2 + 2))))) + x) div (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ 1 (+ (divf (- 2 (divf x (+ 2 2))) (+ 2 2)) x)) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (- 1 (divf (+ 2 (+ 2 x)) (* 2 (* 2 (+ 2 2))))) x) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
