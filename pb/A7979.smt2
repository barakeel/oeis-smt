;; sequence(s): A7979
;; terms: 1 2 5 9 16 25 39 56 79 107 142 183 233 290 357 433 520 617 727 848
;; small program: (1 + loop(((y * y) div (1 + 2)) + x, x, x div 2)) + x
;; fast program: ((((((1 + (2 + (x + x))) * (x * x)) div (2 + (2 + 2))) + x) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* y y) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (divf (* (+ 1 (+ 2 (+ x x))) (* x x)) (+ 2 (+ 2 2))) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
