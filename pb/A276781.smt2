;; sequence(s): A276781
;; terms: 1 1 1 1 1 2 1 1 1 2 1 2 1 2 3 1 1 2 1 2
;; small program: loop((loop(if (loop((1 + loop(x + x, x, 2)) mod (1 + x), 2, x) - 1) <= 0 then 0 else 1, 1, y) * x) + 1, x, 1)
;; fast program: loop((loop(if (loop((1 + (2 * loop(x + x, x mod 2, loop(x * x, 1, loop(x + x, x div 2, 1))))) mod (1 + x), 2, x) - 1) <= 0 then 0 else 1, 1, y) * x) + 1, x, 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f3 (Int) Int)
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
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 () Int)
(declare-fun f9 (Int) Int)
(declare-fun g9 (Int) Int)
(declare-fun h9 () Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int) Int)
(declare-fun h8 (Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
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
(declare-fun h5 (Int Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f3 x) (+ x x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 2))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (modf (+ 1 (v3 x)) (+ 1 x)))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (ite (<= (- (v2 x) 1) 0) 0 1))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (v1 x y) x) 1))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f7 x) (+ x x))))
(assert (forall ((x Int)) (= (g7 x) (modf x 2))))
(assert (forall ((x Int)) (= (f8 x) (* x x))))
(assert (= g8 1))
(assert (forall ((x Int)) (= (f9 x) (+ x x))))
(assert (forall ((x Int)) (= (g9 x) (divf x 2))))
(assert (= h9 1))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int)) (= (v9 x) (u9 (g9 x) h9))))
(assert (forall ((x Int)) (= (h8 x) (v9 x))))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 g8 (h8 x)))))
(assert (forall ((x Int)) (= (h7 x) (v8 x))))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) (h7 x)))))
(assert (forall ((x Int)) (= (f6 x) (modf (+ 1 (* 2 (v7 x))) (+ 1 x)))))
(assert (= g6 2))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 g6 (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (ite (<= (- (v6 x) 1) 0) 0 1))))
(assert (= g5 1))
(assert (forall ((x Int) (y Int)) (= (h5 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 g5 (h5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (* (v5 x y) x) 1))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (v4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
