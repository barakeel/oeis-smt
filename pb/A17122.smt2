;; sequence(s): A17122
;; terms: 1048576 61917364224 10240000000000 296196766695424 3656158440062976 27197360938418176 144555105949057024 604661760000000000 2113922820157210624 6428888932339941376 17490122876598091776
;; small program: loop2(2 * ((x * y) * y), x, 2 + 2, 2, 1 + (x + x)) div 2
;; fast program: (loop((x * x) * x, 2, 2 * (2 + (2 * (x + x)))) * (1 + (2 * x))) * (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (* (* x y) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 2 2)))
(assert (= i0 2))
(assert (forall ((x Int)) (= (j0 x) (+ 1 (+ x x)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (w0 x) 2))))
(assert (forall ((x Int)) (= (f1 x) (* (* x x) x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) (* 2 (+ 2 (* 2 (+ x x)))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (* (v1 x) (+ 1 (* 2 x))) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
