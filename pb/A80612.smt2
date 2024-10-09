;; sequence(s): A80612
;; terms: 1 2 3 4 5 7 9 10 11 12 13 14 15 16 17 18 19 20 21 22
;; small program: 1 + (loop2(y, 2, (x - 2) - 2, 0, 1) + x)
;; fast program: (loop((if x <= 0 then 1 else x) - 1, 2 + ((2 + 2) - x), 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (- (- x 2) 2))))
(assert (= i0 0))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (w0 x) x)))))
(assert (forall ((x Int)) (= (f1 x) (- (ite (<= x 0) 1 x) 1))))
(assert (forall ((x Int)) (= (g1 x) (+ 2 (- (+ 2 2) x)))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v1 x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
