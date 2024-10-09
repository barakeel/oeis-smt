;; sequence(s): A243989
;; terms: 1 3 4 6 7 9 11 12 14 15 17 18 20 21 23 25 26 28 29 31
;; small program: (((loop((loop(x + y, x div 2, y) div x) + y, x, 1) + 2) + x) + x) div 2
;; fast program: (((((((if (x - (2 * (2 + 2))) <= 0 then 1 else 0) + x) div (((1 + 2) + 2) + 2)) + 1) + x) div 2) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int)) (= (g1 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x) (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (v1 x y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (+ (+ (+ (v0 x) 2) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (+ (divf (+ (ite (<= (- x (* 2 (+ 2 2))) 0) 1 0) x) (+ (+ (+ 1 2) 2) 2)) 1) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
