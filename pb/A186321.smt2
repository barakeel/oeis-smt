;; sequence(s): A186321
;; terms: 2 4 7 9 12 15 17 20 22 25 27 30 33 35 38 40 43 45 48 51
;; small program: ((((((loop2((2 * (x + y)) div (1 + x), x + y, x, 1, 2) div 2) div (1 + 2)) + x) div 2) + x) + x) + 2
;; fast program: (((((((1 + x) + ((2 + x) div (1 + (2 + (2 + 2))))) div (1 + (2 + (2 + 2)))) + x) div 2) + x) + x) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (* 2 (+ x y)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ x y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (divf (+ (divf (divf (w0 x) 2) (+ 1 2)) x) 2) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (+ (divf (+ (+ 1 x) (divf (+ 2 x) (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 (+ 2 2)))) x) 2) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
