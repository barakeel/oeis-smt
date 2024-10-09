;; sequence(s): A126026
;; terms: 0 1 2 4 5 8 10 13 17 20 24 28 33 38 43 49 55 61 68 75
;; small program: (loop(((y * y) - x) div 2, x - 1, 0) div 2) + x
;; fast program: ((((x * x) - ((x - 1) div (1 + 2))) - x) div (2 + (2 + 2))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (- (* y y) x) 2))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- (- (* x x) (divf (- x 1) (+ 1 2))) x) (+ 2 (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
