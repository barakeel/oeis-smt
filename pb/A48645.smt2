;; sequence(s): A48645
;; terms: 1 2 3 4 5 6 8 9 10 12 16 17 18 20 24 32 33 34 36 40
;; small program: compr(loop2(x - y, y div 2, x, x - 2, x) + x, 1 + x)
;; fast program: compr(((loop2(((y mod 2) * x) + x, y div 2, 1 + (2 + (2 * (2 + 2))), 1, x) div 2) - 1) - 2, 1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 () Int)
(declare-fun i3 () Int)
(declare-fun j3 (Int) Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun t2 (Int) Int)
(declare-fun u2 (Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (divf y 2))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int)) (= (i1 x) (- x 2))))
(assert (forall ((x Int)) (= (j1 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) (j1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (w1 x) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (* (modf y 2) x) x))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) (divf y 2))))
(assert (= h3 (+ 1 (+ 2 (* 2 (+ 2 2))))))
(assert (= i3 1))
(assert (forall ((x Int)) (= (j3 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 h3 i3 (j3 x)))))
(assert (forall ((x Int)) (= (f2 x) (- (- (divf (w3 x) 2) 1) 2))))
(assert (forall ((x Int)) (= (g2 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t2 x) (ite (<= (f2 x) 0) x (t2 (+ x 1))))))
(assert (forall ((x Int)) (= (u2 x) (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x)))))
(assert (forall ((x Int)) (= (fast x) (v2 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
