;; sequence(s): A162951
;; terms: 0 1 6 8 17 20 41
;; small program: (loop2((x + y) * 2, 1, x div 2, x, 2) div 2) + x
;; fast program: (loop2((x * y) + x, 1, x div 2, 1, x + 2) - 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ x y) 2))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (divf x 2))))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (w0 x) 2) x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* x y) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (divf x 2))))
(assert (= i1 1))
(assert (forall ((x Int)) (= (j1 x) (+ x 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z g1))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (- (w1 x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
