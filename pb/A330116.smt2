;; sequence(s): A330116
;; terms: 1 2 4 5 7 8 10 11 13 14 15 17 18 20 21 23 24 26 27 29
;; small program: loop(((y - ((x div (1 + (2 + 2))) div (1 + 2))) div 2) + y, 2 + x, 1) - 2
;; fast program: (((1 + x) * loop(((2 + x) * x) * x, 1, 1 + 2)) - 1) div ((2 * (2 * (2 * (2 + 2)))) - 1)
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
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (- y (divf (divf x (+ 1 (+ 2 2))) (+ 1 2))) 2) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 2))))
(assert (forall ((x Int)) (= (f1 x) (* (* (+ 2 x) x) x))))
(assert (= g1 1))
(assert (= h1 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (divf (- (* (+ 1 x) v1) 1) (- (* 2 (* 2 (* 2 (+ 2 2)))) 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
