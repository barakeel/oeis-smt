;; sequence(s): A8813
;; terms: 1 2 3 4 5 6 9 12 15 18 21 24 29 34 39 44 49 54 61 68
;; small program: 1 + loop((2 * ((y div 2) div (1 + 2))) + x, x, x)
;; fast program: (((((2 - x) * (2 - x)) div (2 * (2 + (2 + 2)))) * 2) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (divf (divf y 2) (+ 1 2))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (divf (* (- 2 x) (- 2 x)) (* 2 (+ 2 (+ 2 2)))) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
