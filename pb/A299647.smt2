;; sequence(s): A299647
;; terms: 3 8 14 19 25 30 36 41 47 52 58 63 69 74 80 85 91 96 102 107
;; small program: ((x div 2) + loop(1 + (x + x), 2, x)) + x
;; fast program: 1 + (2 + (((2 * (x + x)) + (x div 2)) + x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (divf x 2) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (+ (+ (* 2 (+ x x)) (divf x 2)) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
