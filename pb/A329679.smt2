;; sequence(s): A329679
;; terms: 1 1 1 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
;; small program: 2 div loop(y, x - 2, 2)
;; fast program: 2 div (if (x - 2) <= 0 then 2 else (x - 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf 2 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (divf 2 (ite (<= (- x 2) 0) 2 (- x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
