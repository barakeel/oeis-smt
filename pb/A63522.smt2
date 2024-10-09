;; sequence(s): A63522
;; terms: 0 1 17 63 154 305 531 847 1268 1809 2485 3311 4302 5473 6839 8415 10216 12257 14553 17119
;; small program: (loop2(y - x, x, 2 + 2, x * x, 1) * x) div 2
;; fast program: ((1 + (2 + 2)) * ((((x * x) * x) - x) div 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 2 2)))
(assert (forall ((x Int)) (= (i0 x) (* x x))))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (divf (* (w0 x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ 2 2)) (divf (- (* (* x x) x) x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
