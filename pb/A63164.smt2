;; sequence(s): A63164
;; terms: 9 40 72 104 136 168 200 232 264 296 328 360 392 424 456 488 520 552 584 616
;; small program: (2 * loop(1 + (2 * (x + x)), 2, x)) - (if x <= 0 then 1 else 2)
;; fast program: (2 * (2 * (2 + (2 * (2 * (x + x)))))) + (if x <= 0 then 1 else 0)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* 2 (+ x x))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* 2 (v0 x)) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (+ 2 (* 2 (* 2 (+ x x)))))) (ite (<= x 0) 1 0)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
