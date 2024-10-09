;; sequence(s): A189379
;; terms: 2 4 7 9 12 15 17 20 23 25 28 30 33 36 38 41 44 46 49 51
;; small program: ((loop(((y * y) div (2 + x)) + y, 2 + (x + x), 0) + 1) div 2) + x
;; fast program: (loop((x div (1 + (2 * (2 * (2 + 2))))) + x, 1, 2 * (2 + (x + x))) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (v0 x) 1) 2) x))))
(assert (forall ((x Int)) (= (f1 x) (+ (divf x (+ 1 (* 2 (* 2 (+ 2 2))))) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* 2 (+ 2 (+ x x))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (v1 x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
