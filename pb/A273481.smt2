;; sequence(s): A273481
;; terms: 3 21 24 32 40 48 56 64 72 80 88 96 104 112 120 128 136 144 152 160
;; small program: ((((((((loop(((loop((2 + y) * x, 2, 2) - 1) div (1 + x)) + (x div 2), x, 1) + 2) + x) + x) + x) + x) + x) + x) + x) + x
;; fast program: (((((((((((loop((((2 * (2 * (2 + 2))) + x) + x) div (1 + x), x, x) + x) + x) + 2) + x) + x) + x) + x) + x) + x) + x) + (if x <= 0 then 1 else 2)) - x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* (+ 2 y) x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (divf (- v1 1) (+ 1 x)) (divf x 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (+ (+ (+ (+ (v0 x) 2) x) x) x) x) x) x) x) x))))
(assert (forall ((x Int)) (= (f2 x) (divf (+ (+ (* 2 (* 2 (+ 2 2))) x) x) (+ 1 x)))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (v2 x) x) x) 2) x) x) x) x) x) x) x) (ite (<= x 0) 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
