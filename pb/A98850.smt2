;; sequence(s): A98850
;; terms: 0 19 40 63 88 115 144 175 208 243 280 319 360 403 448 495 544 595 648 703
;; small program: (2 + (loop(x * x, 2, 2) + x)) * x
;; fast program: (2 + ((2 * (2 * (2 + 2))) + x)) * x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* (+ 2 (+ v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 2 (+ (* 2 (* 2 (+ 2 2))) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
