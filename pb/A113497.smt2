;; sequence(s): A113497
;; terms: 1 3 6 6 11 9 16 12 21 15 26 18 31 21 36 24 41 27 46 30
;; small program: 1 + (x + loop2(y, 1 + x, x, x, 1))
;; fast program: ((((x - 1) + x) * ((2 - x) div 2)) + (x * x)) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ x (w0 x))))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (- x 1) x) (divf (- 2 x) 2)) (* x x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
