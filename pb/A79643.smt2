;; sequence(s): A79643
;; terms: 1 2 3 2 2 3 3 4 3 3 3 4 4 4 5 4 4 4 4 5
;; small program: (1 + x) div loop(((y div x) + x) div 2, x, 1)
;; fast program: (1 + x) div loop((y div ((2 + x) * x)) + x, x, 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (+ (divf y x) x) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (+ 1 x) (v0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (divf y (* (+ 2 x) x)) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (divf (+ 1 x) (v1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
