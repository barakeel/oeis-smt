;; sequence(s): A8749
;; terms: 1 1 2 3 4 5 8 9 12 15 18 21 26 29 34 39 44 49 56 61
;; small program: ((loop(x + y, x - 2, 2) div (1 + 2)) + 1) + (x div 2)
;; fast program: ((((((x * x) div (2 + (2 + 2))) + x) div 2) * 2) - (if x <= 0 then 1 else x)) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (v0 x) (+ 1 2)) 1) (divf x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (divf (+ (divf (* x x) (+ 2 (+ 2 2))) x) 2) 2) (ite (<= x 0) 1 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
