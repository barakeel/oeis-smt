;; sequence(s): A70023
;; terms: 1 2 3 4 5 6 8 9 10 12 15 16 18 20 24 25 30 32 36 40
;; small program: loop(compr(loop((x + y) * (((2 + x) * x) * x), 2, 2) mod (1 + x), y), x, x) + 1
;; fast program: compr(loop(loop(((loop2(x * y, 1 + y, x, 1, 2 * (2 + 2)) div loop(x * y, x, 1)) * loop2(x * y, y, x, 1, 2 + (2 * (2 + 2)))) div (1 + x), 1, y) * x, 1 + 2, 1) mod (1 + x), x) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f2 (Int Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun t1 (Int) Int)
(declare-fun u1 (Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun i6 () Int)
(declare-fun j6 () Int)
(declare-fun u6 (Int Int Int) Int)
(declare-fun v6 (Int Int Int) Int)
(declare-fun w6 (Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 () Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f8 (Int Int) Int)
(declare-fun g8 (Int Int) Int)
(declare-fun h8 (Int) Int)
(declare-fun i8 () Int)
(declare-fun j8 () Int)
(declare-fun u8 (Int Int Int) Int)
(declare-fun v8 (Int Int Int) Int)
(declare-fun w8 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 (Int Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 () Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* (+ x y) (* (* (+ 2 x) x) x)))))
(assert (= g2 2))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (f1 x) (modf v2 (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (t1 x) (ite (<= (f1 x) 0) x (t1 (+ x 1))))))
(assert (forall ((x Int)) (= (u1 x) (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 1))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (= i6 1))
(assert (= j6 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w6 x) (u6 (h6 x) i6 j6))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (* x y))))
(assert (forall ((x Int)) (= (g7 x) x)))
(assert (= h7 1))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) h7))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g8 x y) y)))
(assert (forall ((x Int)) (= (h8 x) x)))
(assert (= i8 1))
(assert (= j8 (+ 2 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u8 x y z) (ite (<= x 0) y (f8 (u8 (- x 1) y z) (v8 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v8 x y z) (ite (<= x 0) z (g8 (u8 (- x 1) y z) (v8 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w8 x) (u8 (h8 x) i8 j8))))
(assert (forall ((x Int)) (= (f5 x) (divf (* (divf (w6 x) (v7 x)) (w8 x)) (+ 1 x)))))
(assert (= g5 1))
(assert (forall ((x Int) (y Int)) (= (h5 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 g5 (h5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* (v5 x y) x))))
(assert (= g4 (+ 1 2)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (= v4 (u4 g4 h4)))
(assert (forall ((x Int)) (= (f3 x) (modf v4 (+ 1 x)))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v3 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
