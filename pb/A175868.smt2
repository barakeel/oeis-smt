;; sequence(s): A175868
;; terms: 0 1 2 3 4 6 8 11 15 20 25 32 40 49 59 71 84 99 116 135
;; small program: loop((((y * y) - 1) div loop(2 * (2 + x), 2, 2)) + x, x, x)
;; fast program: ((((((((((((((1 + (x + x)) * ((x * x) + x)) div (1 + 2)) * 2) + 1) + x) div (1 + (2 + 2))) + 2) + x) div 2) div 2) div 2) + 1) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (* 2 (+ 2 x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (- (* y y) 1) v1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (divf (divf (divf (+ (+ (divf (+ (+ (* (divf (* (+ 1 (+ x x)) (+ (* x x) x)) (+ 1 2)) 2) 1) x) (+ 1 (+ 2 2))) 2) x) 2) 2) 2) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
