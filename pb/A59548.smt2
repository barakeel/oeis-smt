;; sequence(s): A59548-A64720
;; terms: 2 4 6 8 10 12 14 16 18 20 23 25 27 29 31 33 35 37 39 41
;; small program: 2 + ((((x div 2) div (1 + (2 + 2))) + x) + x)
;; fast program: 2 + (((x div (2 + (2 * (2 + 2)))) + x) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (+ (divf (divf x 2) (+ 1 (+ 2 2))) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (divf x (+ 2 (* 2 (+ 2 2)))) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
