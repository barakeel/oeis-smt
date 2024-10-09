;; sequence(s): A47598
;; terms: 3 4 5 11 12 13 19 20 21 27 28 29 35 36 37 43 44 45 51 52
;; small program: x + loop2(x + y, x, 2 + 2, x div (1 + 2), 1)
;; fast program: 1 + (2 + (((1 + (2 + 2)) * (x div (1 + 2))) + x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 2 2)))
(assert (forall ((x Int)) (= (i0 x) (divf x (+ 1 2)))))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (+ x (w0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (+ (* (+ 1 (+ 2 2)) (divf x (+ 1 2))) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
