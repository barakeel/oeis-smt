;; sequence(s): A58308
;; terms: 0 1 4 21 130 931 7578 69133 698908 7757121 93784360 1226953801 17271137574 260294017411 4181975416150 71353876091961 1288551745071448 24553837032449473 492365292394060908 10364224977307728541
;; small program: loop2((((x div y) * x) + x) + y, x, x - 1, if x <= 0 then 0 else 1, 1 + 2)
;; fast program: loop2(((1 + (x div y)) * x) + y, x, x - 2, if (x - 1) <= 0 then x else (2 + 2), 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* (divf x y) x) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (- x 1))))
(assert (forall ((x Int)) (= (i0 x) (ite (<= x 0) 0 1))))
(assert (= j0 (+ 1 2)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* (+ 1 (divf x y)) x) y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) (- x 2))))
(assert (forall ((x Int)) (= (i1 x) (ite (<= (- x 1) 0) x (+ 2 2)))))
(assert (= j1 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) j1))))
(assert (forall ((x Int)) (= (fast x) (w1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
