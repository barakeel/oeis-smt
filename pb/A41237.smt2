;; sequence(s): A41237
;; terms: 1 2 5 112 229 570 12769 26108 64985 1455778 2976541 7408860 165971461 339351782 844675025 18922202332 38689079689 96300361710 2157297037309 4410894436328
;; small program: loop2((((if (x mod (1 + (2 + 2))) <= 0 then loop(1 + (x + x), 2, 2) else 1) * 2) * x) + y, x, x, 1, 0)
;; fast program: loop2((((if (x mod (1 + (2 + 2))) <= 0 then (1 + (2 + (2 * (2 + 2)))) else 1) * 2) * x) + y, x, x - 1, if x <= 0 then 1 else 2, 1)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 (Int) Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ 1 (+ x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (* (ite (<= (modf x (+ 1 (+ 2 2))) 0) v1 1) 2) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (* (* (ite (<= (modf x (+ 1 (+ 2 2))) 0) (+ 1 (+ 2 (* 2 (+ 2 2)))) 1) 2) x) y))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int)) (= (h2 x) (- x 1))))
(assert (forall ((x Int)) (= (i2 x) (ite (<= x 0) 1 2))))
(assert (= j2 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) (i2 x) j2))))
(assert (forall ((x Int)) (= (fast x) (w2 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
