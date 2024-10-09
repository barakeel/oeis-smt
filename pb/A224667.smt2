;; sequence(s): A224667
;; terms: 196 260 332 412 500 596 700 812 932 1060 1196 1340 1492 1652 1820 1996 2180 2372 2572 2780
;; small program: (loop(x * x, 1, loop(2 + (x + y), 2, x)) + x) * (2 + 2)
;; fast program: 2 * (2 * (loop(x * x, 1, 1 + (2 + (2 + (2 + x)))) + x))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 1))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 (+ x y)))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (h0 x) (v1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (v0 x) x) (+ 2 2)))))
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ 1 (+ 2 (+ 2 (+ 2 x)))))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* 2 (+ (v2 x) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
