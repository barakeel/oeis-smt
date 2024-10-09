;; sequence(s): A14245
;; terms: 1 1 2 3 3 4 4 5 6 6 7 8 8 9 10 10 11 11 12 13
;; small program: (loop(((((y * y) div (2 + (x + x))) + y) div (1 + x)) + x, x, x) div 2) + 1
;; fast program: ((((1 + ((x - (x div (2 * (2 + 2)))) + x)) div (1 + (2 + (2 + 2)))) + x) div 2) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (+ (divf (* y y) (+ 2 (+ x x))) y) (+ 1 x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (divf (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (divf (+ 1 (+ (- x (divf x (* 2 (+ 2 2)))) x)) (+ 1 (+ 2 (+ 2 2)))) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
