;; sequence(s): A1959
;; terms: 0 2 3 4 6 7 8 9 11 12 13 15 16 17 19 20 21 23 24 25
;; small program: loop(((((y * y) + x) + x) div ((x + y) + y)) + y, x, x)
;; fast program: ((((1 + (2 + 2)) * ((x - 1) + x)) div (1 + (2 * (2 * (2 * (2 + 2)))))) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (+ (+ (* y y) x) x) (+ (+ x y) y)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (* (+ 1 (+ 2 2)) (+ (- x 1) x)) (+ 1 (* 2 (* 2 (* 2 (+ 2 2)))))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
