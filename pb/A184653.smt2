;; sequence(s): A184653
;; terms: 3 5 7 10 12 14 17 19 21 24 26 29 31 33 36 38 40 43 45 48
;; small program: ((loop((((y * y) + x) div (x + y)) div 2, 2 + x, x) + 2) + x) + x
;; fast program: (((((((2 * (2 * (2 + x))) div (1 + (2 * (2 * (2 + (2 * (2 + 2))))))) + x) div (1 + 2)) + 1) + x) + 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (divf (+ (* y y) x) (+ x y)) 2))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (divf (+ (divf (* 2 (* 2 (+ 2 x))) (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2))))))) x) (+ 1 2)) 1) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
