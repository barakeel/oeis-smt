;; sequence(s): A111403
;; terms: 2 12 240 65280 4294901760 18446744069414584320 340282366920938463444927863358058659840 115792089237316195423570985008687907852929702298719625575994209400481361428480
;; small program: loop((x * x) - x, 1, loop(x * x, x, 2))
;; fast program: loop((2 + x) * x, x, 1) * loop(x * x, x, 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- (* x x) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (h0 x) (v1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f2 x) (* (+ 2 x) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (f3 x) (* x x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 2))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (fast x) (* (v2 x) (v3 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
