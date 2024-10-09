;; sequence(s): A285957
;; terms: 0 1 0 0 0 1 0 0 0 1 0 0 0 0 1 0 0 1 0 0
;; small program: (compr(loop((if (x mod 2) <= 0 then 2 else x) div 2, x + x, x), x + x) mod 2) + 0
;; fast program: (loop(((((loop2((y - x) div 2, x, 1 + (2 + (2 + 2)), x div 2, x) + x) div 2) + y) mod 2) + x, 2, x) - x) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun i3 (Int) Int)
(declare-fun j3 (Int) Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (divf (ite (<= (modf x 2) 0) 2 x) 2))))
(assert (forall ((x Int)) (= (g1 x) (+ x x))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (v1 x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (modf (v0 x) 2) 0))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (divf (- y x) 2))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 (+ 1 (+ 2 (+ 2 2)))))
(assert (forall ((x Int)) (= (i3 x) (divf x 2))))
(assert (forall ((x Int)) (= (j3 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 h3 (i3 x) (j3 x)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (modf (+ (divf (+ (w3 x) x) 2) y) 2) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (- (v2 x) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
