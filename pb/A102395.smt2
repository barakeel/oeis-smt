;; sequence(s): A102395
;; terms: 1 0 0 2 0 2 2 2 0 2 2 2 2 2 2 6 0 2 2 2
;; small program: ((((loop2(((y mod 2) * x) + x, y div 2, x, 1, x) - 1) div (1 + 2)) + 1) div (if x <= 0 then 1 else 2)) * (if x <= 0 then 1 else 2)
;; fast program: ((((loop2(((y mod 2) * x) + x, y div 2, 2 + (2 + 2), 1, x div 2) * (1 + (x mod 2))) div (1 + 2)) + 1) div (if x <= 0 then 1 else 2)) * (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
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
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (modf y 2) x) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (divf y 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (* (divf (+ (divf (- (w0 x) 1) (+ 1 2)) 1) (ite (<= x 0) 1 2)) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* (modf y 2) x) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (divf y 2))))
(assert (= h1 (+ 2 (+ 2 2))))
(assert (= i1 1))
(assert (forall ((x Int)) (= (j1 x) (divf x 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 h1 i1 (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (divf (+ (divf (* (w1 x) (+ 1 (modf x 2))) (+ 1 2)) 1) (ite (<= x 0) 1 2)) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
