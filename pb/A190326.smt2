;; sequence(s): A190326
;; terms: 10 21 31 42 53 63 74 84 95 106 116 127 137 148 159 169 180 190 201 212
;; small program: (((2 * loop(x * y, 2 + 2, 1 + x)) div (1 + (2 + 2))) + 1) + x
;; fast program: (loop((x div (1 + (2 + 2))) + x, 1, 2 * (2 * (2 + (x + x)))) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (* 2 (v0 x)) (+ 1 (+ 2 2))) 1) x))))
(assert (forall ((x Int)) (= (f1 x) (+ (divf x (+ 1 (+ 2 2))) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* 2 (* 2 (+ 2 (+ x x)))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v1 x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
