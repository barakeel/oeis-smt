;; sequence(s): A347837
;; terms: 21 53 117 149 181 245 277 309 373 405 437 501 533 565 629 661 693 757 789 821
;; small program: loop2(1 + (x * y), 2 + 2, 1 + 2, ((1 + x) div (1 + 2)) + x, 2)
;; fast program: ((((((((1 + x) div (1 + 2)) + x) * 2) + 1) * (2 + 2)) + 1) * (2 + 2)) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* x y)))))
(assert (= g0 (+ 2 2)))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int)) (= (i0 x) (+ (divf (+ 1 x) (+ 1 2)) x))))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (* (+ (* (+ (divf (+ 1 x) (+ 1 2)) x) 2) 1) (+ 2 2)) 1) (+ 2 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
