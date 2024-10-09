;; sequence(s): A242412
;; terms: 15 23 39 63 95 135 183 239 303 375 455 543 639 743 855 975 1103 1239 1383 1535
;; small program: (2 * (2 * (2 * loop(x + y, x, 2)))) - 1
;; fast program: (2 * (2 * (2 + (2 + ((x * x) + x))))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* 2 (* 2 (* 2 (v0 x)))) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* 2 (+ 2 (+ 2 (+ (* x x) x))))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
