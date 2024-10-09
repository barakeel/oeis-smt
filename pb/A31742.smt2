;; sequence(s): A31742
;; terms: 1025 4098 9219 16388 25605 36870 50183 65544 82953 102410 123915 147468 173069 200718 230415 262160 295953 331794 369683 409620
;; small program: (loop2((x * x) * y, x, 2, 2 + 2, 1 + x) + 1) + x
;; fast program: 1 + (loop(x * x, 1, 2 * (2 * (2 * (2 * (2 + (x + x)))))) + x)
(set-logic UFNIA)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (* x x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (= i0 (+ 2 2)))
(assert (forall ((x Int)) (= (j0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (w0 x) 1) x))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* 2 (* 2 (* 2 (* 2 (+ 2 (+ x x)))))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (v1 x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
