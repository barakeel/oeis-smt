;; sequence(s): A34488
;; terms: 4 12 50 252 1394 8052 47450 282252 1686434 10097892 60526250 362976252 2177317874 13062296532 78368963450 470199366252 2821153019714 16926788715972 101560344351050 609360902796252
;; small program: (1 + loop((x + x) + x, x, 1)) * (1 + loop(x + x, x, 1))
;; fast program: (1 + loop(x + x, x, 1)) * (1 + loop2(x * y, y, x div 2, loop(1 + 2, x mod 2, 1), 1 + (2 * (2 + 2))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun f4 () Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun i3 (Int) Int)
(declare-fun j3 () Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ x x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (v0 x)) (+ 1 (v1 x))))))
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (forall ((x Int)) (= (h3 x) (divf x 2))))
(assert (= f4 (+ 1 2)))
(assert (forall ((x Int)) (= (g4 x) (modf x 2))))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y f4))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (i3 x) (v4 x))))
(assert (= j3 (+ 1 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) (i3 x) j3))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (v2 x)) (+ 1 (w3 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
