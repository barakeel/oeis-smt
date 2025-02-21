;; sequence(s): A295488
;; terms: 20 21 25 26 27 28 32
;; small program: 2 + (((1 + 2) * (2 + loop(1 + (2 + (x div 2)), 2, x))) + x)
;; fast program: (((((2 + ((2 + x) div (2 + 2))) + 2) + 2) * (1 + 2)) + 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ 2 (divf x 2))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (* (+ 1 2) (+ 2 (v0 x))) x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (+ (+ 2 (divf (+ 2 x) (+ 2 2))) 2) 2) (+ 1 2)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
