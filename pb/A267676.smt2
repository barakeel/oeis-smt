;; sequence(s): A267676
;; terms: 1 0 1 0 1 0 1 0 0 1 1 0 1 0 0 0 1 1 1 0
;; small program: (((loop((((loop((((loop((1 - loop((y div (x * x)) + x, x, 1)) + x, 2, x) + 1) + x) mod 2) * (1 + x), 2, x) + 1) mod 2) + 1) + x, 2, x) - x) mod (1 + x)) + 1) mod 2
;; fast program: (((loop((((loop((((loop((loop2(loop(x + y, x, y) div (2 + x), y, 1 + 2, 2, (x - 2) div 2) + 2) + x, 2, x) + 1) + x) mod 2) * (1 + x), 2, x) + 1) mod 2) + 1) + x, 2, x) - x) mod (1 + x)) + 1) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
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
(declare-fun f8 (Int Int) Int)
(declare-fun g8 (Int) Int)
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
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (divf y (* x x)) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (+ (- 1 (v3 x)) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (* (modf (+ (+ (v2 x) 1) x) 2) (+ 1 x)))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (modf (+ (v1 x) 1) 2) 1) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (modf (+ (modf (- (v0 x) x) (+ 1 x)) 1) 2))))
(assert (forall ((x Int) (y Int)) (= (f8 x y) (+ x y))))
(assert (forall ((x Int)) (= (g8 x) x)))
(assert (forall ((x Int) (y Int)) (= (h8 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v8 x y) (u8 (g8 x) (h8 x y)))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (divf (v8 x y) (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) y)))
(assert (= h7 (+ 1 2)))
(assert (= i7 2))
(assert (forall ((x Int)) (= (j7 x) (divf (- x 2) 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 h7 i7 (j7 x)))))
(assert (forall ((x Int)) (= (f6 x) (+ (+ (w7 x) 2) x))))
(assert (= g6 2))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 g6 (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (* (modf (+ (+ (v6 x) 1) x) 2) (+ 1 x)))))
(assert (= g5 2))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 g5 (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (+ (+ (modf (+ (v5 x) 1) 2) 1) x))))
(assert (= g4 2))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (fast x) (modf (+ (modf (- (v4 x) x) (+ 1 x)) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
