;; sequence(s): A49086
;; terms: 1 3 13 57 249 1087 4745 20713 90417 394691 1722917 7520929 32830585 143313055 625594449 2730863665 11920848033 52037243619 227154537661 991581805481
;; small program: ((loop2((((((((y * y) + y) div (x + y)) + x) + y) + x) + x) + x, x + y, x, 1, 1) - 1) div 2) + 1
;; fast program: loop2((((((((1 + y) * y) div (x + y)) + x) + x) + x) + x) + y, x + y, x - 1, (if x <= 0 then 0 else 2) + 1, 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (+ (+ (divf (+ (* y y) y) (+ x y)) x) y) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ x y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (- (w0 x) 1) 2) 1))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (+ (+ (+ (+ (divf (* (+ 1 y) y) (+ x y)) x) x) x) x) y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ x y))))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (forall ((x Int)) (= (i1 x) (+ (ite (<= x 0) 0 2) 1))))
(assert (= j1 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) j1))))
(assert (forall ((x Int)) (= (fast x) (w1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
