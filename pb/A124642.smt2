;; sequence(s): A124642
;; terms: 1 1 2 3 5 9 15 29 50 99 176 351 638 1275 2354 4707 8789 17577 33099 66197
;; small program: loop(loop(loop((x * y) div (y - (y div 2)), y - 1, 1) - x, y, 1) + x, x, 1)
;; fast program: loop(loop(loop(loop(2 * (((x div y) + x) + x), x div 2, 1 + (x mod 2)) div (1 + x), 1, y) - x, y - 1, 0) + x, x, 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
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
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 (Int Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f2 x y) (divf (* x y) (- y (divf y 2))))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (- y 1))))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y) h2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- (v2 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (* 2 (+ (+ (divf x y) x) x)))))
(assert (forall ((x Int)) (= (g6 x) (divf x 2))))
(assert (forall ((x Int)) (= (h6 x) (+ 1 (modf x 2)))))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (divf (v6 x) (+ 1 x)))))
(assert (= g5 1))
(assert (forall ((x Int) (y Int)) (= (h5 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 g5 (h5 x y)))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (- (v5 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) (- y 1))))
(assert (= h4 0))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 (g4 x y) h4))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (v4 x y) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (fast x) (v3 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
