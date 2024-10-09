;; sequence(s): A46998
;; terms: 1 1 12 56 167 391 786 1422 2381 3757 5656 8196 11507 15731 21022 27546 35481 45017 56356 69712
;; small program: loop((((y - 1) + y) * (y * y)) + x, x, 1) - x
;; fast program: ((((((2 * (2 + x)) + x) * ((x * x) * x)) - x) div (2 + (2 + 2))) - x) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ (- y 1) y) (* y y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (divf (- (* (+ (* 2 (+ 2 x)) x) (* (* x x) x)) x) (+ 2 (+ 2 2))) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
