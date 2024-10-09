;; sequence(s): A76012
;; terms: 1 189 21546 1928934 149767947 10598527863 703442942532 44583546335328 2730727849782933 162985193544670497 9536099260315021758 549348981049383669882 31261349005300855653759
;; small program: loop(((loop((loop((loop(loop(1 + (2 * ((x + x) + x)), y, 1) + (2 * (x + x)), y, 1) + (2 * (x + x))) + x, y, 1) + x) + x, y, 1) + x) + x) + x, x, 1) * loop((x + x) + x, x + x, 1)
;; fast program: loop(loop((loop(((loop((loop((x * x) + x, 1, loop(2 + (x + x), x, 2)) div 2) div (1 + 2), 1, y) + x) + x) + x, y, 1) + ((x + x) * 2)) + x, y, 1) + (((x + x) + x) * 2), x, 1) * loop(x * x, 1, loop((x + x) + x, x, 1))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f10 (Int) Int)
(declare-fun g10 () Int)
(declare-fun f11 (Int) Int)
(declare-fun g11 (Int) Int)
(declare-fun h11 () Int)
(declare-fun u11 (Int Int) Int)
(declare-fun v11 (Int) Int)
(declare-fun h10 (Int) Int)
(declare-fun u10 (Int Int) Int)
(declare-fun v10 (Int) Int)
(declare-fun f9 (Int) Int)
(declare-fun g9 () Int)
(declare-fun h9 (Int Int) Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int Int) Int)
(declare-fun f8 (Int Int) Int)
(declare-fun g8 (Int Int) Int)
(declare-fun h8 () Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int Int) Int)
(declare-fun h7 () Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f12 (Int) Int)
(declare-fun g12 () Int)
(declare-fun f13 (Int) Int)
(declare-fun g13 (Int) Int)
(declare-fun h13 () Int)
(declare-fun u13 (Int Int) Int)
(declare-fun v13 (Int) Int)
(declare-fun h12 (Int) Int)
(declare-fun u12 (Int Int) Int)
(declare-fun v12 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f4 x) (+ 1 (* 2 (+ (+ x x) x))))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) y)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 (g4 x y) h4))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (v4 x y) (* 2 (+ x x))))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 (g3 x y) h3))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (+ (v3 x y) (* 2 (+ x x))) x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y) h2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (+ (v2 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (v1 x y) x) x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (f5 x) (+ (+ x x) x))))
(assert (forall ((x Int)) (= (g5 x) (+ x x))))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (v5 x)))))
(assert (forall ((x Int)) (= (f10 x) (+ (* x x) x))))
(assert (= g10 1))
(assert (forall ((x Int)) (= (f11 x) (+ 2 (+ x x)))))
(assert (forall ((x Int)) (= (g11 x) x)))
(assert (= h11 2))
(assert (forall ((x Int) (y Int)) (= (u11 x y) (ite (<= x 0) y (f11 (u11 (- x 1) y))))))
(assert (forall ((x Int)) (= (v11 x) (u11 (g11 x) h11))))
(assert (forall ((x Int)) (= (h10 x) (v11 x))))
(assert (forall ((x Int) (y Int)) (= (u10 x y) (ite (<= x 0) y (f10 (u10 (- x 1) y))))))
(assert (forall ((x Int)) (= (v10 x) (u10 g10 (h10 x)))))
(assert (forall ((x Int)) (= (f9 x) (divf (divf (v10 x) 2) (+ 1 2)))))
(assert (= g9 1))
(assert (forall ((x Int) (y Int)) (= (h9 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v9 x y) (u9 g9 (h9 x y)))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (+ (+ (+ (v9 x y) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (g8 x y) y)))
(assert (= h8 1))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v8 x y) (u8 (g8 x y) h8))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (+ (+ (v8 x y) (* (+ x x) 2)) x))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) y)))
(assert (= h7 1))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 (g7 x y) h7))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ (v7 x y) (* (+ (+ x x) x) 2)))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (= h6 1))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (f12 x) (* x x))))
(assert (= g12 1))
(assert (forall ((x Int)) (= (f13 x) (+ (+ x x) x))))
(assert (forall ((x Int)) (= (g13 x) x)))
(assert (= h13 1))
(assert (forall ((x Int) (y Int)) (= (u13 x y) (ite (<= x 0) y (f13 (u13 (- x 1) y))))))
(assert (forall ((x Int)) (= (v13 x) (u13 (g13 x) h13))))
(assert (forall ((x Int)) (= (h12 x) (v13 x))))
(assert (forall ((x Int) (y Int)) (= (u12 x y) (ite (<= x 0) y (f12 (u12 (- x 1) y))))))
(assert (forall ((x Int)) (= (v12 x) (u12 g12 (h12 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v6 x) (v12 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
