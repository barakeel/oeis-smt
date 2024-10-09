;; sequence(s): A17052
;; terms: 244140625 8916100448256 2213314919066161 95428956661682176 1667889514952984961 16777216000000000000 116191483108948578241 614787626176508399616 2654348974297586158321 9774779120406941925376
;; small program: loop2((x * x) * y, x, 1 + 2, loop(1 + (2 * (x * y)), 2, x) - x, 1)
;; fast program: loop((x * x) * x, 2, 1 + ((2 * (2 + ((x + x) + x))) + x)) * loop((x * x) * x, 1, 1 + ((2 * (2 + ((x + x) + x))) + x))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (* x x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (* 2 (* x y))))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (i0 x) (- (v1 x) x))))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (f2 x) (* (* x x) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) (+ 1 (+ (* 2 (+ 2 (+ (+ x x) x))) x)))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f3 x) (* (* x x) x))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (+ 1 (+ (* 2 (+ 2 (+ (+ x x) x))) x)))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v2 x) (v3 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
