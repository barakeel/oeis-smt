;; sequence(s): A314685
;; terms: 1 5 9 13 17 22 27 31 35 39 44 49 53 57 61 66 71 75 79 83
;; small program: (loop(((((x div 2) div 2) + (x div (1 + 2))) + 2) + y, x, 1) + x) + x
;; fast program: ((((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + 2))) + 1) + x) + (x div (1 + (2 + 2)))) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (divf (divf x 2) 2) (divf x (+ 1 2))) 2) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (divf (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 2))) 1) x) (divf x (+ 1 (+ 2 2)))) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
