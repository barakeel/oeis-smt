;; sequence(s): A67865
;; terms: 36 136 236 336 436 536 636 736 836 936 1036 1136 1236 1336 1436 1536 1636 1736 1836 1936
;; small program: loop(loop2(((x + x) + x) + y, x, 2, x, y), 2, x)
;; fast program: 2 * (2 + (2 * ((2 * (2 * (2 + (2 * ((x + x) + x))))) + x)))
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (+ (+ x x) x) y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int)) (= (i1 x) x)))
(assert (forall ((x Int) (y Int)) (= (j1 x y) y)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w1 x y) (u1 h1 (i1 x) (j1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (w1 x y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (+ 2 (* 2 (+ (* 2 (* 2 (+ 2 (* 2 (+ (+ x x) x))))) x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
