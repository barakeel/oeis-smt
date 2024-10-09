;; sequence(s): A208672
;; terms: 1 3 5 7 9 10 12 14 15 17 19 20 22 23 25 27 28 30 32 33
;; small program: (((((((loop(x * x, 2, 2) * x) div (1 + x)) + x) div (2 + 2)) + x) div 2) + 1) + x
;; fast program: ((((((1 + x) * ((2 * (2 * (2 + x))) + x)) div (2 * (2 + 2))) + x) + x) div (1 + x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (+ (divf (+ (divf (* v0 x) (+ 1 x)) x) (+ 2 2)) x) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (+ (divf (* (+ 1 x) (+ (* 2 (* 2 (+ 2 x))) x)) (* 2 (+ 2 2))) x) x) (+ 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
