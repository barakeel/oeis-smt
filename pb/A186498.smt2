;; sequence(s): A186498
;; terms: 2 3 5 8 10 13 17 20 24 29 33 38 44 49 55 62 68 75 83 90
;; small program: 2 + ((loop(x + y, x, x) div (1 + 2)) + x)
;; fast program: 2 + (((((2 + x) * x) + x) div (2 + (2 + 2))) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (divf (v0 x) (+ 1 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (divf (+ (* (+ 2 x) x) x) (+ 2 (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
