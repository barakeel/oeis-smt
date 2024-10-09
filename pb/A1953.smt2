;; sequence(s): A1953
;; terms: 0 2 3 4 6 7 9 10 12 13 14 16 17 19 20 21 23 24 26 27
;; small program: loop((((2 + y) * y) div (2 + (x + y))) + y, x, 0)
;; fast program: ((((2 * (2 + x)) - (x div (2 + (2 * (2 + 2))))) + x) div (1 + (2 + (2 + 2)))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* (+ 2 y) y) (+ 2 (+ x y))) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (- (* 2 (+ 2 x)) (divf x (+ 2 (* 2 (+ 2 2))))) x) (+ 1 (+ 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
