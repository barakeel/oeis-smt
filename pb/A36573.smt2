;; sequence(s): A36573
;; terms: 4 8 12 17 22 28 34 41 48 56 64 73 82 92 102 113 124 136 148 161
;; small program: 2 + loop(2 + ((y div 2) + x), 1 + x, x)
;; fast program: (2 * (2 + (x + x))) - (((2 - x) * x) div (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (divf y 2) x)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 2 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (+ 2 (+ x x))) (divf (* (- 2 x) x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
