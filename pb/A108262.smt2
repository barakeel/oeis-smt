;; sequence(s): A108262
;; terms: 3 8 39 220 1275 7424 43263 252148 1469619 8565560 49923735 290976844 1695937323 9884647088 57611945199 335787024100 1957110199395 11406874172264 66484134834183 387497934832828
;; small program: 1 + loop2(1 + y, (x + y) + y, x + x, 2, 2)
;; fast program: (loop2((2 * ((x + x) + x)) - y, x, x, 1 + 2, 1 + (2 + 2)) div 2) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ (+ x y) y))))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (= i0 2))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (w0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- (* 2 (+ (+ x x) x)) y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 (+ 1 2)))
(assert (= j1 (+ 1 (+ 2 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (w1 x) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
