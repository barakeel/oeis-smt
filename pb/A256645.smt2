;; sequence(s): A256645
;; terms: 0 1 26 98 240 475 826 1316 1968 2805 3850 5126 6656 8463 10570 13000 15776 18921 22458 26410
;; small program: loop(loop((((2 * (2 * (2 + (2 + 2)))) - 1) * (((x * x) - x) div 2)) + x, 1, y) + x, x, 0)
;; fast program: (((((2 * (2 * (2 + (2 + 2)))) - 1) * ((((x * x) * x) - x) div (1 + 2))) + (x * x)) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
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
(assert (forall ((x Int)) (= (f1 x) (+ (* (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1) (divf (- (* x x) x) 2)) x))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (* (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1) (divf (- (* (* x x) x) x) (+ 1 2))) (* x x)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
