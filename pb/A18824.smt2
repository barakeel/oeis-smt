;; sequence(s): A18824
;; terms: 19 20 21 22 23 24 25 26 27 28 29 30 31 32 34 35 36 37 38 39
;; small program: ((if loop((x div 2) - y, 2, x) <= 0 then 1 else 2) + x) + (2 + loop(x * x, 2, 2))
;; fast program: (((if ((x - 1) - (2 * (2 + (2 + 2)))) <= 0 then 1 else 2) + x) + (((2 + 2) * 2) * 2)) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (divf x 2) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (+ (+ (ite (<= (v0 x) 0) 1 2) x) (+ 2 v1)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (ite (<= (- (- x 1) (* 2 (+ 2 (+ 2 2)))) 0) 1 2) x) (* (* (+ 2 2) 2) 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
