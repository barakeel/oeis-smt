;; sequence(s): A47371
;; terms: 0 2 3 5 7 9 10 12 14 16 17 19 21 23 24 26 28 30 31 33
;; small program: (((0 - (x div 2)) div 2) + x) + x
;; fast program: (((1 - x) div (2 + 2)) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (- 0 (divf x 2)) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (- 1 x) (+ 2 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
