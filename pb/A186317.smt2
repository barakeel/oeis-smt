;; sequence(s): A186317
;; terms: 2 3 5 7 8 10 12 13 15 17 19 20 22 24 25 27 29 30 32 34
;; small program: loop((((y * y) + x) div (2 * (x * x))) + x, 1 + x, 1) + x
;; fast program: (((((((2 * (x div (2 + (2 * (2 + 2))))) + x) div (2 + (2 * (2 + 2)))) - x) div (1 + 2)) + 2) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (+ (* y y) x) (* 2 (* x x))) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (- (divf (+ (* 2 (divf x (+ 2 (* 2 (+ 2 2))))) x) (+ 2 (* 2 (+ 2 2)))) x) (+ 1 2)) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
