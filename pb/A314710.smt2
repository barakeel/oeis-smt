;; sequence(s): A314710
;; terms: 1 5 9 13 18 22 27 31 35 40 45 49 53 58 62 67 71 75 80 85
;; small program: (((loop((1 + (x + x)) div (1 + 2), 2, x) + (if x <= 0 then 1 else x)) + x) + x) + x
;; fast program: ((((((((1 + (x + x)) div (1 + 2)) * 2) + 1) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (divf (+ 1 (+ x x)) (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (v0 x) (ite (<= x 0) 1 x)) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (divf (+ (* (divf (+ 1 (+ x x)) (+ 1 2)) 2) 1) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
