;; sequence(s): A198017
;; terms: 1 10 26 49 79 116 160 211 269 334 406 485 571 664 764 871 985 1106 1234 1369
;; small program: loop(((2 + x) * (2 + y)) div y, x, 1) + (x * x)
;; fast program: (1 + ((1 + 2) * ((2 + x) * x))) + (((x * x) - x) div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (* (+ 2 x) (+ 2 y)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) (* x x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (* (+ 1 2) (* (+ 2 x) x))) (divf (- (* x x) x) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
