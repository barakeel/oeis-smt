;; sequence(s): A86205
;; terms: 1 1 6 360 302400 4572288000 1520925880320000 13153940405570764800000 3412910854477066178396160000000 30107378079113824305786648526848000000000
;; small program: loop(loop2(x * y, 1 + y, y, x, y), x, 1)
;; fast program: loop(loop2(x * y, 1 + y, y, 1, 2 + y) * x, x - 1, 1) * loop(x * y, x, 1)
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 (Int Int) Int)
(declare-fun i3 () Int)
(declare-fun j3 (Int Int) Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ 1 y))))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int)) (= (i1 x) x)))
(assert (forall ((x Int) (y Int)) (= (j1 x y) y)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w1 x y) (u1 (h1 x y) (i1 x) (j1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (w1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) (+ 1 y))))
(assert (forall ((x Int) (y Int)) (= (h3 x y) y)))
(assert (= i3 1))
(assert (forall ((x Int) (y Int)) (= (j3 x y) (+ 2 y))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w3 x y) (u3 (h3 x y) i3 (j3 x y)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* (w3 x y) x))))
(assert (forall ((x Int)) (= (g2 x) (- x 1))))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* x y))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (* (v2 x) (v4 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
