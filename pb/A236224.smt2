;; sequence(s): A236224
;; terms: 65536 43112257 152631002882 33385561572483 45983115425144644 711399724608324485 49372591600275192966 337814005167896360647 6470424420848895009608 256716898101196243797129 984140019848381507625610 13321651934065547869899851
;; small program: loop(loop(loop2((compr((1 + loop(x * y, x, 1)) mod (1 + x), y) * x) + x, y, 2 * (2 * (2 + 2)), 1, x), 1, y) + x, 1 + x, 0)
;; fast program: loop(loop(loop2(loop(loop2(loop(loop2((compr(loop((1 - loop(x + x, x div 2, 1)) mod (1 + x), 1 - (x mod 2), x) - 2, y) * x) + x, y, 2 + 2, 1, x), 1, y) * x, y, 2, 1, x), 1, y) * x, y, 2, 1, x), 1, y) + x, 1 + x, 0)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int Int) Int)
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
(declare-fun f14 (Int) Int)
(declare-fun g14 (Int) Int)
(declare-fun h14 () Int)
(declare-fun u14 (Int Int) Int)
(declare-fun v14 (Int) Int)
(declare-fun f13 (Int) Int)
(declare-fun g13 (Int) Int)
(declare-fun h13 (Int) Int)
(declare-fun u13 (Int Int) Int)
(declare-fun v13 (Int) Int)
(declare-fun f12 (Int) Int)
(declare-fun g12 (Int Int) Int)
(declare-fun t12 (Int) Int)
(declare-fun u12 (Int) Int)
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
(declare-fun h10 (Int Int) Int)
(declare-fun u10 (Int Int) Int)
(declare-fun v10 (Int Int) Int)
(declare-fun f9 (Int Int) Int)
(declare-fun g9 (Int Int) Int)
(declare-fun h9 () Int)
(declare-fun i9 () Int)
(declare-fun j9 (Int) Int)
(declare-fun u9 (Int Int Int) Int)
(declare-fun v9 (Int Int Int) Int)
(declare-fun w9 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 () Int)
(declare-fun h8 (Int Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int Int) Int)
(declare-fun h7 () Int)
(declare-fun i7 () Int)
(declare-fun j7 (Int) Int)
(declare-fun u7 (Int Int Int) Int)
(declare-fun v7 (Int Int Int) Int)
(declare-fun w7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun h6 (Int Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* x y))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (f3 x) (modf (+ 1 (v4 x)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 (g3 x y)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (* (v3 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (= h2 (* 2 (* 2 (+ 2 2)))))
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
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f14 x) (+ x x))))
(assert (forall ((x Int)) (= (g14 x) (divf x 2))))
(assert (= h14 1))
(assert (forall ((x Int) (y Int)) (= (u14 x y) (ite (<= x 0) y (f14 (u14 (- x 1) y))))))
(assert (forall ((x Int)) (= (v14 x) (u14 (g14 x) h14))))
(assert (forall ((x Int)) (= (f13 x) (modf (- 1 (v14 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g13 x) (- 1 (modf x 2)))))
(assert (forall ((x Int)) (= (h13 x) x)))
(assert (forall ((x Int) (y Int)) (= (u13 x y) (ite (<= x 0) y (f13 (u13 (- x 1) y))))))
(assert (forall ((x Int)) (= (v13 x) (u13 (g13 x) (h13 x)))))
(assert (forall ((x Int)) (= (f12 x) (- (v13 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g12 x y) y)))
(assert (forall ((x Int)) (= (t12 x) (ite (<= (f12 x) 0) x (t12 (+ x 1))))))
(assert (forall ((x Int)) (= (u12 x) (ite (<= x 0) (t12 0) (t12 (+ (u12 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v12 x y) (u12 (g12 x y)))))
(assert (forall ((x Int) (y Int)) (= (f11 x y) (+ (* (v12 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g11 x y) y)))
(assert (= h11 (+ 2 2)))
(assert (= i11 1))
(assert (forall ((x Int)) (= (j11 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u11 x y z) (ite (<= x 0) y (f11 (u11 (- x 1) y z) (v11 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v11 x y z) (ite (<= x 0) z (g11 (u11 (- x 1) y z) (v11 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w11 x) (u11 h11 i11 (j11 x)))))
(assert (forall ((x Int)) (= (f10 x) (w11 x))))
(assert (= g10 1))
(assert (forall ((x Int) (y Int)) (= (h10 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u10 x y) (ite (<= x 0) y (f10 (u10 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v10 x y) (u10 g10 (h10 x y)))))
(assert (forall ((x Int) (y Int)) (= (f9 x y) (* (v10 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g9 x y) y)))
(assert (= h9 2))
(assert (= i9 1))
(assert (forall ((x Int)) (= (j9 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u9 x y z) (ite (<= x 0) y (f9 (u9 (- x 1) y z) (v9 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v9 x y z) (ite (<= x 0) z (g9 (u9 (- x 1) y z) (v9 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w9 x) (u9 h9 i9 (j9 x)))))
(assert (forall ((x Int)) (= (f8 x) (w9 x))))
(assert (= g8 1))
(assert (forall ((x Int) (y Int)) (= (h8 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v8 x y) (u8 g8 (h8 x y)))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (* (v8 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) y)))
(assert (= h7 2))
(assert (= i7 1))
(assert (forall ((x Int)) (= (j7 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 h7 i7 (j7 x)))))
(assert (forall ((x Int)) (= (f6 x) (w7 x))))
(assert (= g6 1))
(assert (forall ((x Int) (y Int)) (= (h6 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v6 x y) (u6 g6 (h6 x y)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (+ (v6 x y) x))))
(assert (forall ((x Int)) (= (g5 x) (+ 1 x))))
(assert (= h5 0))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (fast x) (v5 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
