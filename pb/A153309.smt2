;; sequence(s): A153309
;; terms: 0 1 3 5 7 8 9 11 13 15 16 17 18 19 21 23 25 27 28 29
;; small program: loop((loop(if ((1 + loop(x + x, x, x)) mod (1 + x)) <= 0 then 1 else 0, 1, (x + x) + x) + 1) + x, x, 1) - 1
;; fast program: compr((loop((((loop(((if (loop(((loop(x * x, 1, loop(x + x, x div 2, 1)) * (1 + (x mod 2))) - 1) mod (1 + x), (1 + x) mod 2, x) - 2) <= 0 then 1 else 2) mod (1 + x)) mod 2, 1, (x + x) + x) + x) mod 2) + (x mod 2)) + x, 2, x) + x) mod 2, x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 () Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 (Int) Int)
(declare-fun h8 () Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int) Int)
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
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (ite (<= (modf (+ 1 (v2 x)) (+ 1 x)) 0) 1 0))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ (+ x x) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (v1 x) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (f7 x) (* x x))))
(assert (= g7 1))
(assert (forall ((x Int)) (= (f8 x) (+ x x))))
(assert (forall ((x Int)) (= (g8 x) (divf x 2))))
(assert (= h8 1))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 (g8 x) h8))))
(assert (forall ((x Int)) (= (h7 x) (v8 x))))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 g7 (h7 x)))))
(assert (forall ((x Int)) (= (f6 x) (modf (- (* (v7 x) (+ 1 (modf x 2))) 1) (+ 1 x)))))
(assert (forall ((x Int)) (= (g6 x) (modf (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (modf (modf (ite (<= (- (v6 x) 2) 0) 1 2) (+ 1 x)) 2))))
(assert (= g5 1))
(assert (forall ((x Int)) (= (h5 x) (+ (+ x x) x))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 g5 (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (+ (+ (modf (+ (v5 x) x) 2) (modf x 2)) x))))
(assert (= g4 2))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (modf (+ (v4 x) x) 2))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x)))))
(assert (forall ((x Int)) (= (fast x) (v3 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
