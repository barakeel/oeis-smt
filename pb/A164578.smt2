;; sequence(s): A164578
;; terms: 10 23 65 94 168 213 319 380 518 595 765 858 1060 1169 1403 1528 1794 1935 2233 2390
;; small program: ((((loop(x * x, 1, 2 * (2 + ((x div 2) + x))) div (1 + 2)) * 2) * 2) - x) div 2
;; fast program: loop((2 * (2 * (x * x))) - x, 1, 2 * (2 + ((x div 2) + x))) div (2 + (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
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
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (* 2 (+ 2 (+ (divf x 2) x))))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (- (* (* (divf (v0 x) (+ 1 2)) 2) 2) x) 2))))
(assert (forall ((x Int)) (= (f1 x) (- (* 2 (* 2 (* x x))) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* 2 (+ 2 (+ (divf x 2) x))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (v1 x) (+ 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
