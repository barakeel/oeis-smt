;; sequence(s): A65882
;; terms: 1 2 3 1 1 2 3 2 1 2 3 3 1 2 3 1 1 2 3 1
;; small program: loop(x div (if (x mod (2 + 2)) <= 0 then (2 + 2) else 1), x, 1 + x) mod (2 + 2)
;; fast program: loop2(loop(x div loop(1, x mod (2 + 2), 2 + 2), 1 + 2, x), 1, (x mod (2 + 2)) - 2, 1 + x, x) mod (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 () Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (divf x (ite (<= (modf x (+ 2 2)) 0) (+ 2 2) 1)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (modf (v0 x) (+ 2 2)))))
(assert (= f3 1))
(assert (forall ((x Int)) (= (g3 x) (modf x (+ 2 2)))))
(assert (= h3 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y f3))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (divf x (v3 x)))))
(assert (= g2 (+ 1 2)))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (v2 x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (- (modf x (+ 2 2)) 2))))
(assert (forall ((x Int)) (= (i1 x) (+ 1 x))))
(assert (forall ((x Int)) (= (j1 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z g1))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (modf (w1 x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
