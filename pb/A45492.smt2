;; sequence(s): A45492
;; terms: 1 19 218 1955 15086 105102 679764 4154403 24281510 136887322 749032492 3997228430 20880823820 107088473660 540472210728 2689562860323 13217998697430 64240718824930 309108505173820
;; small program: loop(loop((((loop((((loop(((((loop(2 * (((x div y) + x) + x), y, 1) div (1 + y)) + x) + x) + x) + x, y, 1) + x) + x) + x) + x, y, 1) + x) + x) + x) + x, y, 1) + (2 * (x + x)), x, 1)
;; fast program: loop(loop((((loop((((loop((((loop(loop2(x * y, 1 + y, x, 1, 2 + x) div loop(x * y, x, 1), 1, y) + x) + x) + x) + x, y, 1) + x) + x) + x) + x, y, 1) + x) + x) + x) + x, y, 1) + (2 * (x + x)), x, 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f4 (Int Int) Int)
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
(declare-fun small (Int) Int)
(declare-fun f10 (Int Int) Int)
(declare-fun g10 (Int Int) Int)
(declare-fun h10 (Int) Int)
(declare-fun i10 () Int)
(declare-fun j10 (Int) Int)
(declare-fun u10 (Int Int Int) Int)
(declare-fun v10 (Int Int Int) Int)
(declare-fun w10 (Int) Int)
(declare-fun f11 (Int Int) Int)
(declare-fun g11 (Int) Int)
(declare-fun h11 () Int)
(declare-fun u11 (Int Int) Int)
(declare-fun v11 (Int) Int)
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
(declare-fun g6 (Int Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* 2 (+ (+ (divf x y) x) x)))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) y)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 (g4 x y) h4))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (+ (+ (+ (divf (v4 x y) (+ 1 y)) x) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 (g3 x y) h3))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (+ (+ (+ (v3 x y) x) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y) h2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (+ (+ (+ (v2 x y) x) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) (* 2 (+ x x))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f10 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g10 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h10 x) x)))
(assert (= i10 1))
(assert (forall ((x Int)) (= (j10 x) (+ 2 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u10 x y z) (ite (<= x 0) y (f10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v10 x y z) (ite (<= x 0) z (g10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w10 x) (u10 (h10 x) i10 (j10 x)))))
(assert (forall ((x Int) (y Int)) (= (f11 x y) (* x y))))
(assert (forall ((x Int)) (= (g11 x) x)))
(assert (= h11 1))
(assert (forall ((x Int) (y Int)) (= (u11 x y) (ite (<= x 0) y (f11 (u11 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v11 x) (u11 (g11 x) h11))))
(assert (forall ((x Int)) (= (f9 x) (divf (w10 x) (v11 x)))))
(assert (= g9 1))
(assert (forall ((x Int) (y Int)) (= (h9 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v9 x y) (u9 g9 (h9 x y)))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (+ (+ (+ (+ (v9 x y) x) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (g8 x y) y)))
(assert (= h8 1))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v8 x y) (u8 (g8 x y) h8))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (+ (+ (+ (+ (v8 x y) x) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) y)))
(assert (= h7 1))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v7 x y) (u7 (g7 x y) h7))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ (+ (+ (+ (v7 x y) x) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) y)))
(assert (= h6 1))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v6 x y) (u6 (g6 x y) h6))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (+ (v6 x y) (* 2 (+ x x))))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (fast x) (v5 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
