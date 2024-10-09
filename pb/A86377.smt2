;; sequence(s): A86377
;; terms: 1 4 6 8 11 13 16 18 21 23 25 28 30 33 35 37 40 42 45 47
;; small program: loop(((y + y) div (x * x)) + x, (x * x) + x, 1) + x
;; fast program: ((((((2 * (2 + x)) - (x div (2 + (2 * (2 + 2))))) + x) div (1 + (2 + (2 + 2)))) + 1) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (+ y y) (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) (+ (* x x) x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (+ (- (* 2 (+ 2 x)) (divf x (+ 2 (* 2 (+ 2 2))))) x) (+ 1 (+ 2 (+ 2 2)))) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
