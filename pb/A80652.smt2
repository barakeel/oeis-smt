;; sequence(s): A80652
;; terms: 2 5 7 9 12 14 17 19 22 24 26 29 31 34 36 38 41 43 46 48
;; small program: loop(2 + ((((2 + y) * y) div (x + y)) + y), x, 2) + x
;; fast program: ((((((2 * (2 + x)) - (x div (2 + (2 * (2 + 2))))) + x) div (1 + (2 + (2 + 2)))) + 2) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (divf (* (+ 2 y) y) (+ x y)) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (+ (- (* 2 (+ 2 x)) (divf x (+ 2 (* 2 (+ 2 2))))) x) (+ 1 (+ 2 (+ 2 2)))) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
