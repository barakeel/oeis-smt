;; sequence(s): A22273
;; terms: 0 8 31 69 122 190 273 371 484 612 755 913 1086 1274 1477 1695 1928 2176 2439 2717
;; small program: (2 * (2 * (2 * (x * x)))) + loop(x - y, x, x)
;; fast program: (2 * (2 * (2 * (x * x)))) + (((1 - x) * x) div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (* 2 (* 2 (* x x)))) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (* 2 (* x x)))) (divf (* (- 1 x) x) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
