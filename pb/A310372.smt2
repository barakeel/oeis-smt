;; sequence(s): A310372
;; terms: 1 4 10 14 18 22 28 32 36 42 46 50 54 60 64 68 74 78 82 86
;; small program: (((loop(y - (((x div 2) + x) div 2), x, 2) div 2) + x) + x) * (if x <= 0 then 1 else 2)
;; fast program: (((((1 + (2 + (x + x))) div (1 + (2 + (2 + 2)))) + x) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (divf (+ (divf x 2) x) 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ (+ (divf (v0 x) 2) x) x) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (divf (+ 1 (+ 2 (+ x x))) (+ 1 (+ 2 (+ 2 2)))) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
