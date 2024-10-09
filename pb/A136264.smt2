;; sequence(s): A136264
;; terms: 1 0 ~16 ~64 ~160 ~320 ~560 ~896 ~1344 ~1920 ~2640 ~3520 ~4576 ~5824 ~7280 ~8960 ~10880 ~13056 ~15504 ~18240
;; small program: loop((1 - ((y * y) + y)) + x, (x - 1) + x, 1)
;; fast program: loop((if x <= 0 then 1 else x) - ((((x * x) * x) - x) div (1 + 2)), 1, x + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- 1 (+ (* y y) y)) x))))
(assert (forall ((x Int)) (= (g0 x) (+ (- x 1) x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (- (ite (<= x 0) 1 x) (divf (- (* (* x x) x) x) (+ 1 2))))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
