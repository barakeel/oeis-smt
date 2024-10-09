;; sequence(s): A153143
;; terms: 0 2 5 6 9 11 12 14 17 20 21 24 26 27 30 32 35 39 41 42
;; small program: loop((loop((loop((compr(loop2(1 + (x + y), x, x, 0, 1) mod (1 + x), 2 + x) div 2) - 2, 1, 2 + x) - 1) - 2, 1, 2 + x) - 2) - 2, 1, 2 + x)
;; fast program: loop(((loop((loop((compr(loop(loop2(x + y, x, x, 1, 2) mod (1 + x), (1 + x) mod 2, x) - 1, 2 + x) - 1) - 2, 1, 2 + x) - 2) - 2, 1, 2 + x) div 2) - 2) - 1, 1, 2 + x) - 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun i4 () Int)
(declare-fun j4 () Int)
(declare-fun u4 (Int Int Int) Int)
(declare-fun v4 (Int Int Int) Int)
(declare-fun w4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f10 (Int Int) Int)
(declare-fun g10 (Int) Int)
(declare-fun h10 (Int) Int)
(declare-fun i10 () Int)
(declare-fun j10 () Int)
(declare-fun u10 (Int Int Int) Int)
(declare-fun v10 (Int Int Int) Int)
(declare-fun w10 (Int) Int)
(declare-fun f9 (Int) Int)
(declare-fun g9 (Int) Int)
(declare-fun h9 (Int) Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 (Int) Int)
(declare-fun t8 (Int) Int)
(declare-fun u8 (Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 () Int)
(declare-fun h7 (Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (= i4 0))
(assert (= j4 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u4 x y z) (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v4 x y z) (ite (<= x 0) z (g4 (u4 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w4 x) (u4 (h4 x) i4 j4))))
(assert (forall ((x Int)) (= (f3 x) (modf (w4 x) (+ 1 x)))))
(assert (forall ((x Int)) (= (g3 x) (+ 2 x))))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x)))))
(assert (forall ((x Int)) (= (f2 x) (- (divf (v3 x) 2) 2))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (- (- (v2 x) 1) 2))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (- (- (v1 x) 2) 2))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f10 x y) (+ x y))))
(assert (forall ((x Int)) (= (g10 x) x)))
(assert (forall ((x Int)) (= (h10 x) x)))
(assert (= i10 1))
(assert (= j10 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u10 x y z) (ite (<= x 0) y (f10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v10 x y z) (ite (<= x 0) z (g10 (u10 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w10 x) (u10 (h10 x) i10 j10))))
(assert (forall ((x Int)) (= (f9 x) (modf (w10 x) (+ 1 x)))))
(assert (forall ((x Int)) (= (g9 x) (modf (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h9 x) x)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int)) (= (v9 x) (u9 (g9 x) (h9 x)))))
(assert (forall ((x Int)) (= (f8 x) (- (v9 x) 1))))
(assert (forall ((x Int)) (= (g8 x) (+ 2 x))))
(assert (forall ((x Int)) (= (t8 x) (ite (<= (f8 x) 0) x (t8 (+ x 1))))))
(assert (forall ((x Int)) (= (u8 x) (ite (<= x 0) (t8 0) (t8 (+ (u8 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v8 x) (u8 (g8 x)))))
(assert (forall ((x Int)) (= (f7 x) (- (- (v8 x) 1) 2))))
(assert (= g7 1))
(assert (forall ((x Int)) (= (h7 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 g7 (h7 x)))))
(assert (forall ((x Int)) (= (f6 x) (- (- (v7 x) 2) 2))))
(assert (= g6 1))
(assert (forall ((x Int)) (= (h6 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 g6 (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (- (- (divf (v6 x) 2) 2) 1))))
(assert (= g5 1))
(assert (forall ((x Int)) (= (h5 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 g5 (h5 x)))))
(assert (forall ((x Int)) (= (fast x) (- (v5 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
