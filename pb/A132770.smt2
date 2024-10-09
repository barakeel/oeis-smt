;; sequence(s): A132770
;; terms: 0 29 60 93 128 165 204 245 288 333 380 429 480 533 588 645 704 765 828 893
;; small program: ((loop((x * x) + y, 2, 2) + x) * x) + x
;; fast program: ((2 * (2 + (2 * (2 + (2 + 2))))) + x) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* x x) y))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (+ v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* 2 (+ 2 (* 2 (+ 2 (+ 2 2))))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
