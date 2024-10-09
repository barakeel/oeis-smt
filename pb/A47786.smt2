;; sequence(s): A47786
;; terms: 0 6 87 417 1278 3060 6261 11487 19452 30978 46995 68541 96762 132912 178353 234555 303096 385662 484047 600153
;; small program: ((((loop(1 + ((x + x) + x), 2, x) * x) * x) * x) - x) div 2
;; fast program: ((((((2 * (2 + (2 * (x + x)))) + x) * x) * x) * x) - x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (+ x x) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (- (* (* (* (v0 x) x) x) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (- (* (* (* (+ (* 2 (+ 2 (* 2 (+ x x)))) x) x) x) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
