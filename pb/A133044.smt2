;; sequence(s): A133044
;; terms: 1 2 3 7 11 20 36 61 110 191 335 591 1032 1816 3185 5586 9811 17207 30203 53004
;; small program: loop(loop(loop2(loop2(((y * y) + y) div ((x + y) + y), x + y, y, 1, 2) * x, y, 2, 1, x), 1, y) + x, x, 1)
;; fast program: loop(loop2(loop(loop2(((y * y) div (x + y)) + x, x, x - 2, 2, 2) - 1, 1, y) * x, y, 2, 1, y) + x, x, 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 (Int Int) Int)
(declare-fun i3 () Int)
(declare-fun j3 () Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 () Int)
(declare-fun i2 () Int)
(declare-fun j2 (Int) Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
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
(declare-fun g6 () Int)
(declare-fun h6 (Int Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 () Int)
(declare-fun i5 () Int)
(declare-fun j5 (Int Int) Int)
(declare-fun u5 (Int Int Int) Int)
(declare-fun v5 (Int Int Int) Int)
(declare-fun w5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (divf (+ (* y y) y) (+ (+ x y) y)))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (h3 x y) y)))
(assert (= i3 1))
(assert (= j3 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w3 x y) (u3 (h3 x y) i3 j3))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* (w3 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (= h2 2))
(assert (= i2 1))
(assert (forall ((x Int)) (= (j2 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 h2 i2 (j2 x)))))
(assert (forall ((x Int)) (= (f1 x) (w2 x))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (+ (divf (* y y) (+ x y)) x))))
(assert (forall ((x Int)) (= (g7 x) x)))
(assert (forall ((x Int)) (= (h7 x) (- x 2))))
(assert (= i7 2))
(assert (= j7 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 (h7 x) i7 j7))))
(assert (forall ((x Int)) (= (f6 x) (- (w7 x) 1))))
(assert (= g6 1))
(assert (forall ((x Int) (y Int)) (= (h6 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v6 x y) (u6 g6 (h6 x y)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (* (v6 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) y)))
(assert (= h5 2))
(assert (= i5 1))
(assert (forall ((x Int) (y Int)) (= (j5 x y) y)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u5 x y z) (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v5 x y z) (ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w5 x y) (u5 h5 i5 (j5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (w5 x y) x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (v4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
