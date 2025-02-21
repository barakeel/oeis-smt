;; sequence(s): A97482
;; terms: 1 1 4 5 7 8 10 11 13 14 16 17 19 20 22 23 25 26 28 29
;; small program: 1 + ((x div 2) + (if (x div 2) <= 0 then 0 else x))
;; fast program: 1 + ((x div 2) + loop(0, 2 - x, x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (divf x 2) (ite (<= (divf x 2) 0) 0 x))))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (divf x 2) (v0 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
