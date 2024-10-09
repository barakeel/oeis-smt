;; sequence(s): A315203
;; terms: 1 6 10 14 20 24 28 34 38 42 48 54 58 62 68 72 76 82 86 90
;; small program: (((((2 + ((2 * ((x div 2) div (1 + (2 + 2)))) + x)) div (1 + 2)) + x) * 2) + (if x <= 0 then 1 else x)) + x
;; fast program: (((((2 + ((2 * (x div (2 + (2 * (2 + 2))))) + x)) div (1 + 2)) + x) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ (divf (+ 2 (+ (* 2 (divf (divf x 2) (+ 1 (+ 2 2)))) x)) (+ 1 2)) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (divf (+ 2 (+ (* 2 (divf x (+ 2 (* 2 (+ 2 2))))) x)) (+ 1 2)) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
