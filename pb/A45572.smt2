;; sequence(s): A45572-A85820
;; terms: 1 3 7 9 11 13 17 19 21 23 27 29 31 33 37 39 41 43 47 49
;; small program: 1 + (2 * (((1 + (x div 2)) div 2) + x))
;; fast program: 1 + (2 * (((2 + x) div (2 + 2)) + x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (* 2 (+ (divf (+ 1 (divf x 2)) 2) x))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (+ (divf (+ 2 x) (+ 2 2)) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
