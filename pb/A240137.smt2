;; sequence(s): A240137
;; terms: 0 1 35 216 748 1925 4131 7840 13616 22113 34075 50336 71820 99541 134603 178200 231616 296225 373491 464968
;; small program: loop2(((y * y) * y) + x, 1 + y, x, 0, x)
;; fast program: ((((2 * (x * x)) - x) + (((x * x) - x) div 2)) * (((x * x) * (1 + 2)) - x)) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (* y y) y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 0))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ (- (* 2 (* x x)) x) (divf (- (* x x) x) 2)) (- (* (* x x) (+ 1 2)) x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
