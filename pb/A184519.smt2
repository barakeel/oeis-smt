;; sequence(s): A184519
;; terms: 2 8 13 18 23 28 34 39 44 49 55 60 65 70 76 81 86 91 97 102
;; small program: loop(((loop(x + y, y, x) div (2 + (x + x))) + y) + y, 1 + (x + x), 0) + x
;; fast program: ((((((((((((((((((((2 * (2 + (x + x))) + (x div (1 + (2 + (2 + 2))))) div ((2 + 1) + 2)) + 1) + x) + 2) + x) + x) + x) div 2) + x) + x) div (2 + 1)) + x) + 1) div 2) + x) + x) + 2) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (divf (v1 x y) (+ 2 (+ x x))) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (divf (+ (+ (divf (+ (+ (divf (+ (+ (+ (+ (+ (+ (divf (+ (* 2 (+ 2 (+ x x))) (divf x (+ 1 (+ 2 (+ 2 2))))) (+ (+ 2 1) 2)) 1) x) 2) x) x) x) 2) x) x) (+ 2 1)) x) 1) 2) x) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
