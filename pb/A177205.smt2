;; sequence(s): A177205
;; terms: 0 0 0 1 2 3 5 8 12 17 23 30 38 48 60 73 88 105 124 145
;; small program: loop((y * y) + x, x, 2 * (2 + 2)) div (1 + loop(x * x, 2, 2))
;; fast program: (((((1 + (x + x)) * ((x * x) + x)) div (1 + 2)) div (1 + (2 * (2 * (2 + 2))))) + 1) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (divf (v0 x) (+ 1 v1)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (divf (divf (* (+ 1 (+ x x)) (+ (* x x) x)) (+ 1 2)) (+ 1 (* 2 (* 2 (+ 2 2))))) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
