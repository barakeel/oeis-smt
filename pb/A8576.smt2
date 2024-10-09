;; sequence(s): A8576
;; terms: 1 3 5 8 11 13 16 19 21 24 27 29 32 35 37 40 43 45 48 51
;; small program: 1 + loop(((x div 2) div 2) + y, x + x, 0)
;; fast program: ((((1 - x) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (divf x 2) 2) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (- 1 x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
