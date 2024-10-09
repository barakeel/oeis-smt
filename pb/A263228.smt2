;; sequence(s): A263228
;; terms: 0 6 76 210 408 670 996 1386 1840 2358 2940 3586 4296 5070 5908 6810 7776 8806 9900 11058
;; small program: loop((x - y) + x, 2 + 2, x + x) * x
;; fast program: (loop(((x - 2) * x) - x, 1, 2 * (x + x)) - x) * 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x y) x))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) x))))
(assert (forall ((x Int)) (= (f1 x) (- (* (- x 2) x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* 2 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (- (v1 x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
