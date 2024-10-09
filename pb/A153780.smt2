;; sequence(s): A153780
;; terms: 0 10 50 120 220 350 510 700 920 1170 1450 1760 2100 2470 2870 3300 3760 4250 4770 5320
;; small program: (loop(1 - (x + x), 2 + 2, x) - x) * x
;; fast program: (1 + (2 + 2)) * (((1 + 2) * (x * x)) - x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 1 (+ x x)))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ 2 2)) (- (* (+ 1 2) (* x x)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
