;; sequence(s): A7587
;; terms: 0 1 13 46 110 215 371 588 876 1245 1705 2266 2938 3731 4655 5720 6936 8313 9861 11590
;; small program: loop((((2 * ((y - 2) + y)) + y) * y) + x, x, 0)
;; fast program: (((1 + (x + x)) * (((1 + (2 + 2)) * (x * x)) - x)) div (2 + (2 + 2))) - x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ (* 2 (+ (- y 2) y)) y) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (- (divf (* (+ 1 (+ x x)) (- (* (+ 1 (+ 2 2)) (* x x)) x)) (+ 2 (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
