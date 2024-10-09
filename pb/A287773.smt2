;; sequence(s): A287773
;; terms: 0 1 0 1 0 1 0 1 0 0 1 0 1 0 1 0 1 0 1 0
;; small program: (loop((((((x mod (1 + loop(x * x, 2, 2))) div 2) div 2) + x) mod 2) + x, 2, x div (1 + 2)) + x) mod 2
;; fast program: (loop(((((2 * (2 + (x + x))) div (1 + (2 * (2 * (2 + 2))))) + x) mod 2) + x, 2, x div (1 + 2)) + x) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (modf (+ (divf (divf (modf x (+ 1 v1)) 2) 2) x) 2) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (divf x (+ 1 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (modf (+ (v0 x) x) 2))))
(assert (forall ((x Int)) (= (f2 x) (+ (modf (+ (divf (* 2 (+ 2 (+ x x))) (+ 1 (* 2 (* 2 (+ 2 2))))) x) 2) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) (divf x (+ 1 2)))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (modf (+ (v2 x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
