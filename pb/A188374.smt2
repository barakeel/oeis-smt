;; sequence(s): A188374
;; terms: 1 0 0 1 0 0 1 1 0 0 1 0 0 1 1 0 0 1 0 0
;; small program: (loop(((loop(2 + (((y * y) div x) + (x div 2)), 2 + x, 1) + 1) mod 2) + x, 2, x) - x) div 2
;; fast program: ((loop(((((((((2 + (((x div (2 + (2 * (2 + (2 + 2))))) + x) + x)) div (1 + (2 + 2))) + 1) + x) mod 2) * 2) - 1) + 1) + x, 2, x) - x) div 2) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 (+ (divf (* y y) x) (divf x 2))))))
(assert (forall ((x Int)) (= (g1 x) (+ 2 x))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (+ (modf (+ (v1 x) 1) 2) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (- (v0 x) x) 2))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (- (* (modf (+ (+ (divf (+ 2 (+ (+ (divf x (+ 2 (* 2 (+ 2 (+ 2 2))))) x) x)) (+ 1 (+ 2 2))) 1) x) 2) 2) 1) 1) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (modf (divf (- (v2 x) x) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
