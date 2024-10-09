;; sequence(s): A189468
;; terms: 2 5 7 11 13 16 18 22 24 27 29 33 35 38 40 44 46 49 51 55
;; small program: ((((((1 + ((x div (2 + loop(2 * (2 + x), 2, 2))) + x)) div 2) * (1 + 2)) div 2) + 2) + x) + x
;; fast program: (((((((1 + ((x div (2 + (2 * (2 + (2 * (2 + 2)))))) + x)) div 2) + x) + x) * (1 + 2)) div 2) + 2) - x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (divf (* (divf (+ 1 (+ (divf x (+ 2 v0)) x)) 2) (+ 1 2)) 2) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (+ (divf (* (+ (+ (divf (+ 1 (+ (divf x (+ 2 (* 2 (+ 2 (* 2 (+ 2 2)))))) x)) 2) x) x) (+ 1 2)) 2) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
