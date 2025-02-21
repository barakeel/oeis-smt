;; sequence(s): A229146
;; terms: 0 4 52 243 736 1750 3564 6517 11008 17496 26500 38599 54432 74698 100156 131625 169984 216172 271188 336091
;; small program: ((2 * (x * x)) + loop(x + y, x, x)) * (x * x)
;; fast program: (((2 * (x * x)) + (((x * x) + x) div 2)) + x) * (x * x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (* 2 (* x x)) (v0 x)) (* x x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ (+ (* 2 (* x x)) (divf (+ (* x x) x) 2)) x) (* x x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
