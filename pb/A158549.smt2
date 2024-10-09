;; sequence(s): A158549
;; terms: 1 27 105 235 417 651 937 1275 1665 2107 2601 3147 3745 4395 5097 5851 6657 7515 8425 9387
;; small program: 1 + ((loop(1 + (x * x), 2, 2) * x) * x)
;; fast program: 1 + (2 * ((1 + (2 * (2 + (2 + 2)))) * (x * x)))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ 1 (* (* v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (* (+ 1 (* 2 (+ 2 (+ 2 2)))) (* x x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
