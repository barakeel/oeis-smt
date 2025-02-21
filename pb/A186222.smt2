;; sequence(s): A186222
;; terms: 1 4 6 9 11 13 16 18 21 23 26 28 30 33 35 38 40 42 45 47
;; small program: loop(loop(x + y, x, y) div x, (2 + x) * x, 1) + x
;; fast program: (((((1 - ((x - (x div (1 + (2 + (2 + 2))))) div (1 + (2 + 2)))) + x) div 2) + 1) + x) + x
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
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x) (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) (* (+ 2 x) x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (+ (- 1 (divf (- x (divf x (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2)))) x) 2) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
