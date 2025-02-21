;; sequence(s): A153126
;; terms: 1 6 18 33 55 80 112 147 189 234 286 341 403 468 540 615 697 782 874 969
;; small program: loop(((2 + ((2 * (y + y)) + y)) * y) - x, x, 1)
;; fast program: ((2 * ((2 + x) * x)) + ((x * x) div 2)) - ((x - 1) div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* (+ 2 (+ (* 2 (+ y y)) y)) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (- (+ (* 2 (* (+ 2 x) x)) (divf (* x x) 2)) (divf (- x 1) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
