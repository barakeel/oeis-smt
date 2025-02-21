;; sequence(s): A213040
;; terms: 1 3 4 6 9 11 12 14 17 21 24 26 27 29 32 36 41 45 48 50
;; small program: loop(loop((loop(loop(((loop((1 - loop((y div (x * x)) + x, x, 1)) + x, 2, x) + 1) + x) mod 2, 1, y) + x, x - 1, 1) * 2) - x, 1, y) + x, x, 1) + x
;; fast program: loop(loop((loop(loop(((loop(loop2(loop(x + y, x, y) div x, y, 1 + 2, 2 + 2, x div 2) + x, 2, x) + 1) + x) mod 2, 1, y) + x, x - 1, 1) * 2) - x, 1, y) + x, x, 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
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
(declare-fun f12 (Int Int) Int)
(declare-fun g12 (Int) Int)
(declare-fun h12 (Int Int) Int)
(declare-fun u12 (Int Int) Int)
(declare-fun v12 (Int Int) Int)
(declare-fun f11 (Int Int) Int)
(declare-fun g11 (Int Int) Int)
(declare-fun h11 () Int)
(declare-fun i11 () Int)
(declare-fun j11 (Int) Int)
(declare-fun u11 (Int Int Int) Int)
(declare-fun v11 (Int Int Int) Int)
(declare-fun w11 (Int) Int)
(declare-fun f10 (Int) Int)
(declare-fun g10 () Int)
(declare-fun h10 (Int) Int)
(declare-fun u10 (Int Int) Int)
(declare-fun v10 (Int) Int)
(declare-fun f9 (Int) Int)
(declare-fun g9 () Int)
(declare-fun h9 (Int Int) Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int Int) Int)
(declare-fun f8 (Int Int) Int)
(declare-fun g8 (Int) Int)
(declare-fun h8 () Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 () Int)
(declare-fun h7 (Int Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f5 x y) (+ (divf y (* x x)) x))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (f4 x) (+ (- 1 (v5 x)) x))))
(assert (= g4 2))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (modf (+ (+ (v4 x) 1) x) 2))))
(assert (= g3 1))
(assert (forall ((x Int) (y Int)) (= (h3 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 g3 (h3 x y)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (v3 x y) x))))
(assert (forall ((x Int)) (= (g2 x) (- x 1))))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (f1 x) (- (* (v2 x) 2) x))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int) (y Int)) (= (f12 x y) (+ x y))))
(assert (forall ((x Int)) (= (g12 x) x)))
(assert (forall ((x Int) (y Int)) (= (h12 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u12 x y) (ite (<= x 0) y (f12 (u12 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v12 x y) (u12 (g12 x) (h12 x y)))))
(assert (forall ((x Int) (y Int)) (= (f11 x y) (divf (v12 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g11 x y) y)))
(assert (= h11 (+ 1 2)))
(assert (= i11 (+ 2 2)))
(assert (forall ((x Int)) (= (j11 x) (divf x 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u11 x y z) (ite (<= x 0) y (f11 (u11 (- x 1) y z) (v11 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v11 x y z) (ite (<= x 0) z (g11 (u11 (- x 1) y z) (v11 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w11 x) (u11 h11 i11 (j11 x)))))
(assert (forall ((x Int)) (= (f10 x) (+ (w11 x) x))))
(assert (= g10 2))
(assert (forall ((x Int)) (= (h10 x) x)))
(assert (forall ((x Int) (y Int)) (= (u10 x y) (ite (<= x 0) y (f10 (u10 (- x 1) y))))))
(assert (forall ((x Int)) (= (v10 x) (u10 g10 (h10 x)))))
(assert (forall ((x Int)) (= (f9 x) (modf (+ (+ (v10 x) 1) x) 2))))
(assert (= g9 1))
(assert (forall ((x Int) (y Int)) (= (h9 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v9 x y) (u9 g9 (h9 x y)))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (+ (v9 x y) x))))
(assert (forall ((x Int)) (= (g8 x) (- x 1))))
(assert (= h8 1))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v8 x) (u8 (g8 x) h8))))
(assert (forall ((x Int)) (= (f7 x) (- (* (v8 x) 2) x))))
(assert (= g7 1))
(assert (forall ((x Int) (y Int)) (= (h7 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 g7 (h7 x y)))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ (v7 x y) x))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (= h6 1))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (fast x) (+ (v6 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
