;; sequence(s): A221908
;; terms: 1 12 48 234 1320 7806 46692 279978 1679664 10077750 60466236 362797122 2176782408 13060694094 78364164180 470184984666 2821109907552 16926659444838 101559956668524 609359740010610
;; small program: (2 * ((x + x) + x)) + loop(2 * ((x + x) + x), x, 1)
;; fast program: (2 * ((x + x) + x)) + loop2(x * y, y, x, 1, 2 + (2 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ (+ x x) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (+ (+ x x) x)) (v0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 1))
(assert (= j1 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ (+ x x) x)) (w1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
