;; sequence(s): A189980
;; terms: 1 1 6 6 21 21 56 56 126 126 252 252 462 462 792 792 1287 1287 2002 2002
;; small program: loop((((2 * (x + x)) + x) div y) + x, x div 2, 1)
;; fast program: loop(((loop((2 + x) * (((x * x) * x) - x), 1, 2 + x) div (2 * (2 * (2 + (2 + 2))))) * x) div (1 + (2 + 2)), 1, (2 + x) div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (+ (* 2 (+ x x)) x) y) x))))
(assert (forall ((x Int)) (= (g0 x) (divf x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f2 x) (* (+ 2 x) (- (* (* x x) x) x)))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (divf (* (divf (v2 x) (* 2 (* 2 (+ 2 (+ 2 2))))) x) (+ 1 (+ 2 2))))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (divf (+ 2 x) 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
