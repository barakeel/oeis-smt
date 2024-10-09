;; sequence(s): A256680
;; terms: 0 1 5 7 10 12 15 17 20 22 25 27 30 32 35 37 40 42 45 47
;; small program: loop((if x <= 0 then 1 else 2) + x, x, x div 2)
;; fast program: ((x div 2) + loop(0, 2 - x, x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= x 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (= f1 0))
(assert (forall ((x Int)) (= (g1 x) (- 2 x))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf x 2) (v1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
