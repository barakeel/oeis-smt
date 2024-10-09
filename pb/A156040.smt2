;; sequence(s): A156040
;; terms: 1 1 3 4 6 8 11 13 17 20 24 28 33 37 43 48 54 60 67 73
;; small program: 1 + (((((x * x) div 2) - x) div (1 + 2)) + x)
;; fast program: 1 + ((((x - 2) * x) div (2 + (2 + 2))) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (divf (- (divf (* x x) 2) x) (+ 1 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (divf (* (- x 2) x) (+ 2 (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
