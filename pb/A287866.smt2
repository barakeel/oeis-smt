;; sequence(s): A287866
;; terms: 0 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2
;; small program: loop(((x div 2) + y) div 2, if x <= 0 then 0 else 2, x)
;; fast program: ((2 + x) div (2 * (2 * (2 + 2)))) + (if x <= 0 then 0 else 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (+ (divf x 2) y) 2))))
(assert (forall ((x Int)) (= (g0 x) (ite (<= x 0) 0 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ 2 x) (* 2 (* 2 (+ 2 2)))) (ite (<= x 0) 0 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
