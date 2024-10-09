;; sequence(s): A285958
;; terms: 1 3 4 5 7 8 9 11 12 13 14 16 17 19 20 21 23 24 25 27
;; small program: (1 - (loop2(y - x, y div 2, x + x, 0, x) div 2)) + x
;; fast program: ((((loop2((y - x) div 2, x, 1 + (2 + 2), x div 2, 0) + 1) + x) div 2) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (divf y 2))))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (= i0 0))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (- 1 (divf (w0 x) 2)) x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (divf (- y x) 2))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 (+ 1 (+ 2 2))))
(assert (forall ((x Int)) (= (i1 x) (divf x 2))))
(assert (= j1 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 h1 (i1 x) j1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (+ (w1 x) 1) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
