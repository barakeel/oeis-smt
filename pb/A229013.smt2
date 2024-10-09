;; sequence(s): A229013
;; terms: 2 15 46 101 186 307 470 681 946 1271 1662 2125 2666 3291 4006 4817 5730 6751 7886 9141
;; small program: 2 + (loop((x + y) + y, 2 + x, x) * x)
;; fast program: 2 + ((((1 + (2 + x)) * (2 + x)) + x) * x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ x y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 2 (* (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (* (+ (* (+ 1 (+ 2 x)) (+ 2 x)) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
