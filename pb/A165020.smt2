;; sequence(s): A165020
;; terms: 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
;; small program: 1 + (if (2 + (2 - x)) <= 0 then 2 else 1)
;; fast program: 1 + loop(1, 2 + (2 - x), 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (ite (<= (+ 2 (- 2 x)) 0) 2 1)))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (- 2 x)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (v0 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
