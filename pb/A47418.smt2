;; sequence(s): A47418
;; terms: 0 2 3 4 6 8 10 11 12 14 16 18 19 20 22 24 26 27 28 30
;; small program: loop(0 - (((x * y) div (2 + (2 + y))) + x), 2, x)
;; fast program: (2 + (2 * (2 * ((x div (1 + (2 + 2))) + x)))) div (1 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- 0 (+ (divf (* x y) (+ 2 (+ 2 y))) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (divf (+ 2 (* 2 (* 2 (+ (divf x (+ 1 (+ 2 2))) x)))) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
