;; sequence(s): A135161
;; terms: ~2 ~3 11 183 1679 13407 101231 743103 5367359 38380287 272649551 1928319423 13596611039 95666704767 672114757871 4717029550143 33080299566719 231867445262847 1624598512962191 11379820536259263
;; small program: (loop2(((2 * ((x + x) + x)) + x) + y, (2 * (y + y)) + y, x, 0, 2) - loop((x + x) + x, x, 1)) - loop(x + x, x, 1)
;; fast program: ((loop2(x * y, y, x, 1, 1 + (2 + (2 + 2))) - loop(x + x, x, 1)) - loop2(x * y, y, x div 2, loop(1 + 2, x mod 2, 1), 1 + (2 * (2 + 2)))) - loop2(x * y, y, x, 1, 1 + (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun i3 () Int)
(declare-fun j3 () Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun f6 () Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun i5 (Int) Int)
(declare-fun j5 () Int)
(declare-fun u5 (Int Int Int) Int)
(declare-fun v5 (Int Int Int) Int)
(declare-fun w5 (Int) Int)
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int Int) Int)
(declare-fun h7 (Int) Int)
(declare-fun i7 () Int)
(declare-fun j7 () Int)
(declare-fun u7 (Int Int Int) Int)
(declare-fun v7 (Int Int Int) Int)
(declare-fun w7 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* 2 (+ (+ x x) x)) x) y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ (* 2 (+ y y)) y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 0))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (f1 x) (+ (+ x x) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (small x) (- (- (w0 x) (v1 x)) (v2 x)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (= i3 1))
(assert (= j3 (+ 1 (+ 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) i3 j3))))
(assert (forall ((x Int)) (= (f4 x) (+ x x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) y)))
(assert (forall ((x Int)) (= (h5 x) (divf x 2))))
(assert (= f6 (+ 1 2)))
(assert (forall ((x Int)) (= (g6 x) (modf x 2))))
(assert (= h6 1))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y f6))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (i5 x) (v6 x))))
(assert (= j5 (+ 1 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u5 x y z) (ite (<= x 0) y (f5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v5 x y z) (ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w5 x) (u5 (h5 x) (i5 x) j5))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g7 x y) y)))
(assert (forall ((x Int)) (= (h7 x) x)))
(assert (= i7 1))
(assert (= j7 (+ 1 (+ 2 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u7 x y z) (ite (<= x 0) y (f7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v7 x y z) (ite (<= x 0) z (g7 (u7 (- x 1) y z) (v7 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w7 x) (u7 (h7 x) i7 j7))))
(assert (forall ((x Int)) (= (fast x) (- (- (- (w3 x) (v4 x)) (w5 x)) (w7 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
