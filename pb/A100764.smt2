;; sequence(s): A100764
;; terms: 1 2 3 7 13 19 25 31 37 43 49 55 61 67 73 79 85 91 97 103
;; small program: 1 + loop((y + y) + y, 2 * (x - 2), x)
;; fast program: ((((loop2(x + y, 2, x - 2, x - 1, 1) * x) * 2) + 1) + x) div (if x <= 0 then 1 else x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ y y) y))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (- x 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) (- x 2))))
(assert (forall ((x Int)) (= (i1 x) (- x 1))))
(assert (= j1 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z g1))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) j1))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (* (* (w1 x) x) 2) 1) x) (ite (<= x 0) 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
