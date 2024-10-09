;; sequence(s): A1973
;; terms: 1 1 3 5 8 12 18 24 33 43 55 69 86 104 126 150 177 207 241 277
;; small program: (((loop(((y * y) div (1 + 2)) + x, 2 + x, x div 2) + 1) div 2) + 1) div 2
;; fast program: (((loop((((1 + (2 + (x + x))) * (x * x)) div (2 + (2 + 2))) + x, 1, 2 + x) div 2) div (1 + 2)) + 1) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* y y) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (+ (divf (+ (v0 x) 1) 2) 1) 2))))
(assert (forall ((x Int)) (= (f1 x) (+ (divf (* (+ 1 (+ 2 (+ x x))) (* x x)) (+ 2 (+ 2 2))) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (divf (divf (v1 x) 2) (+ 1 2)) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
