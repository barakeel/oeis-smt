;; sequence(s): A25769
;; terms: 1 1 1 2 2 2 3 3 4 5 5 6 7 7 8 9 10 11 12 13
;; small program: (((loop((y div 2) + x, x, 1) div (1 + 2)) + x) div (2 + 2)) + 1
;; fast program: ((1 + ((((x * x) div (2 + (2 + 2))) + x) + x)) div (2 * (2 + 2))) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf y 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (divf (v0 x) (+ 1 2)) x) (+ 2 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ 1 (+ (+ (divf (* x x) (+ 2 (+ 2 2))) x) x)) (* 2 (+ 2 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
