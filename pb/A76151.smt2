;; sequence(s): A76151
;; terms: 1 8 110 2184 57120 1860480 72681840 3315312000 173059286400 10178348544000 666172912204800 48032775105638400 3783468344527872000 323279062935013785600 29783920485745730304000 2943352142120754524160000 310589942708652231905280000
;; small program: loop2((2 + y) * x, 1 + y, x, 1, 2 * (2 + x))
;; fast program: loop2(x * y, 1 + y, x, 1, 2 + (2 * (2 + x)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) (* 2 (+ 2 x)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 1))
(assert (forall ((x Int)) (= (j1 x) (+ 2 (* 2 (+ 2 x))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (w1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
