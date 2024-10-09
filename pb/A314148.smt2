;; sequence(s): A314148
;; terms: 1 5 11 16 22 27 33 38 43 49 54 60 65 71 76 81 87 92 98 103
;; small program: ((2 * (x + x)) + loop((y - (x div (1 + 2))) div 2, x, 1)) + x
;; fast program: (((((((1 + 2) * (1 + x)) div (1 + (2 + (2 + 2)))) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (- y (divf x (+ 1 2))) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* 2 (+ x x)) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (divf (* (+ 1 2) (+ 1 x)) (+ 1 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
