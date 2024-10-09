;; sequence(s): A43663-A43703
;; terms: 14 16 17 18 19 20 21 22 23 24 25 26 27 28 29 31 32 33 34 35
;; small program: (((x - 1) div (loop(x * x, 2, 2) - 2)) + ((2 * (2 * (2 + 2))) - 1)) + x
;; fast program: (((2 * (2 + (2 + 2))) - ((0 - x) div (2 + (2 * (2 + (2 + 2)))))) + 2) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (- x 1) (- v0 2)) (- (* 2 (* 2 (+ 2 2))) 1)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (* 2 (+ 2 (+ 2 2))) (divf (- 0 x) (+ 2 (* 2 (+ 2 (+ 2 2)))))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
