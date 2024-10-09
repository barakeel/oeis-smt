;; sequence(s): A240960
;; terms: 2 3 5 7 11 13 15 17 19 23 29 31 37 41 43 47 53 59 61 67
;; small program: loop(compr(((loop(((if (((1 + loop2(x + y, x, x, 1, 2)) mod (1 + x)) - 2) <= 0 then 1 else 0) + x) mod 2, x mod 2, 1 + x) + x) mod 2) mod (1 + x), y), x, 0) + 2
;; fast program: compr(loop((((((((if (((1 + loop2(x + y, x, x, 1, 2)) mod (1 + x)) - 2) <= 0 then 1 else 2) mod 2) + 1) mod (1 + 2)) - 1) mod (1 + 2)) - 1) mod (1 + x), (1 + x) mod 2, x) - 1, 1 + x) + 1
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
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun t1 (Int) Int)
(declare-fun u1 (Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun i6 () Int)
(declare-fun j6 () Int)
(declare-fun u6 (Int Int Int) Int)
(declare-fun v6 (Int Int Int) Int)
(declare-fun w6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun t4 (Int) Int)
(declare-fun u4 (Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ x y))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (= i3 1))
(assert (= j3 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) i3 j3))))
(assert (forall ((x Int)) (= (f2 x) (modf (+ (ite (<= (- (modf (+ 1 (w3 x)) (+ 1 x)) 2) 0) 1 0) x) 2))))
(assert (forall ((x Int)) (= (g2 x) (modf x 2))))
(assert (forall ((x Int)) (= (h2 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (modf (modf (+ (v2 x) x) 2) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (t1 x) (ite (<= (f1 x) 0) x (t1 (+ x 1))))))
(assert (forall ((x Int)) (= (u1 x) (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ x y))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (= i6 1))
(assert (= j6 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w6 x) (u6 (h6 x) i6 j6))))
(assert (forall ((x Int)) (= (f5 x) (modf (- (modf (- (modf (+ (modf (ite (<= (- (modf (+ 1 (w6 x)) (+ 1 x)) 2) 0) 1 2) 2) 1) (+ 1 2)) 1) (+ 1 2)) 1) (+ 1 x)))))
(assert (forall ((x Int)) (= (g5 x) (modf (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (- (v5 x) 1))))
(assert (forall ((x Int)) (= (g4 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t4 x) (ite (<= (f4 x) 0) x (t4 (+ x 1))))))
(assert (forall ((x Int)) (= (u4 x) (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v4 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
