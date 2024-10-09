;; sequence(s): A89581
;; terms: 6 35 143 323 667 1147 1763 2491 3599 4757 5767 7387 9797 11021 12317 16637 19043 22499 25591 28891
;; small program: loop2(loop(compr(loop2(1 + (x + y), x, x, 0, 1) mod (1 + x), 1 + x) + 1, 1, y) * x, 1 + y, 2, 1, x + x)
;; fast program: loop2((compr(loop(loop2(x + y, x, x, 1, 2) mod (1 + x), (1 + x) mod 2, x) - 1, 1 + y) + 1) * x, 1 + y, 2, 1, x + x)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun i3 () Int)
(declare-fun j3 () Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun t2 (Int) Int)
(declare-fun u2 (Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun i7 () Int)
(declare-fun j7 () Int)
(declare-fun u7 (Int Int Int) Int)
(declare-fun v7 (Int Int Int) Int)
(declare-fun w7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun t5 (Int) Int)
(declare-fun u5 (Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 () Int)
(declare-fun i4 () Int)
(declare-fun j4 (Int) Int)
(declare-fun u4 (Int Int Int) Int)
(declare-fun v4 (Int Int Int) Int)
(declare-fun w4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (= i3 0))
(assert (= j3 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) i3 j3))))
(assert (forall ((x Int)) (= (f2 x) (modf (w3 x) (+ 1 x)))))
(assert (forall ((x Int)) (= (g2 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t2 x) (ite (<= (f2 x) 0) x (t2 (+ x 1))))))
(assert (forall ((x Int)) (= (u2 x) (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x)))))
(assert (forall ((x Int)) (= (f1 x) (+ (v2 x) 1))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (v1 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ 1 y))))
(assert (= h0 2))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) (+ x x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (+ x y))))
(assert (forall ((x Int)) (= (g7 x) x)))
(assert (forall ((x Int)) (= (h7 x) x)))
(assert (= i7 1))
(assert (= j7 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 (h7 x) i7 j7))))
(assert (forall ((x Int)) (= (f6 x) (modf (w7 x) (+ 1 x)))))
(assert (forall ((x Int)) (= (g6 x) (modf (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (- (v6 x) 1))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (t5 x) (ite (<= (f5 x) 0) x (t5 (+ x 1))))))
(assert (forall ((x Int)) (= (u5 x) (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 (g5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* (+ (v5 x y) 1) x))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) (+ 1 y))))
(assert (= h4 2))
(assert (= i4 1))
(assert (forall ((x Int)) (= (j4 x) (+ x x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u4 x y z) (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v4 x y z) (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w4 x) (u4 h4 i4 (j4 x)))))
(assert (forall ((x Int)) (= (fast x) (w4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
