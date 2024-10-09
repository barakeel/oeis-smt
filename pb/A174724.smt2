;; sequence(s): A174724
;; terms: 4 7 9 11 13 15 17 19 21 22 23 24 25 26 27 28 29 30 31 32
;; small program: (loop(2 + (((2 - x) div (2 * (2 + 2))) + x), x, 2) + 2) + x
;; fast program: ((((1 - loop(y, x - (2 * (2 + 2)), 0)) + 2) + x) + (if x <= 0 then 1 else 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 2 (+ (divf (- 2 x) (* 2 (+ 2 2))) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 2) x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) y)))
(assert (forall ((x Int)) (= (g1 x) (- x (* 2 (+ 2 2))))))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (- 1 (v1 x)) 2) x) (ite (<= x 0) 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
