;; sequence(s): A320604
;; terms: 4 3 3 3 4 3 4 3 3 3 4 3 4 3 3 3 4 3 4 3
;; small program: loop(loop2(y, y - x, x, 1, 2), 2, 2 + x) + 2
;; fast program: 2 + (if (((2 + x) * x) mod (2 + (2 + 2))) <= 0 then 2 else 1)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (- y x))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 1))
(assert (= j1 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (f0 x) (w1 x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (ite (<= (modf (* (+ 2 x) x) (+ 2 (+ 2 2))) 0) 2 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
