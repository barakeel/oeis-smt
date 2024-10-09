;; sequence(s): A193249
;; terms: 1 153 755 2107 4509 8261 13663 21015 30617 42769 57771 75923 97525 122877 152279 186031 224433 267785 316387 370539
;; small program: (loop(2 + (x + y), 2 * ((2 * (x + x)) + x), 1) * (1 + x)) + x
;; fast program: ((loop((2 * (x * x)) - x, 1, (2 * (2 + (x + x))) + x) * x) - x) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ (* 2 (+ x x)) x)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) (+ 1 x)) x))))
(assert (forall ((x Int)) (= (f1 x) (- (* 2 (* x x)) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ (* 2 (+ 2 (+ x x))) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (v1 x) x) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
