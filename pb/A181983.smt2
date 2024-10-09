;; sequence(s): A181983
;; terms: 0 1 ~2 3 ~4 5 ~6 7 ~8 9 ~10 11 ~12 13 ~14 15 ~16 17 ~18 19
;; small program: 0 - loop(0 - x, x, x)
;; fast program: if (x mod 2) <= 0 then (0 - x) else x
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 0 x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- 0 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (modf x 2) 0) (- 0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
