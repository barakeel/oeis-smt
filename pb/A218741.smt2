;; sequence(s): A218741
;; terms: 0 1 39 1483 56355 2141491 81376659 3092313043 117507895635 4465300034131 169681401296979 6447893249285203 245019943472837715 9310757851967833171 353808798374777660499 13444734338241551098963
;; small program: loop(1 + (loop(2 + (x * x), 2, 2) * x), x, 0)
;; fast program: (loop2(x * y, y, x, 1, 1 + (2 + (2 * (2 * (2 + 2))))) * loop(x + x, x, 1)) div loop(1 + ((2 + 2) * x), 2, 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ 2 (* x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* v1 x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (= i2 1))
(assert (= j2 (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 j2))))
(assert (forall ((x Int)) (= (f3 x) (+ x x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f4 x) (+ 1 (* (+ 2 2) x)))))
(assert (= g4 2))
(assert (= h4 2))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (= v4 (u4 g4 h4)))
(assert (forall ((x Int)) (= (fast x) (divf (* (w2 x) (v3 x)) v4))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
