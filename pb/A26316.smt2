;; sequence(s): A26316
;; terms: 1 4 7 8 10 11 13 14 16 17 20 23 26 29 30 32 33 35 36 38
;; small program: loop((((((2 + (2 + x)) mod loop(1 + (x + x), 2, 2)) - 1) mod (1 + 2)) + 1) + x, x, 2) - 1
;; fast program: loop((((((2 + (2 + x)) mod (1 + (2 + (2 * (2 + 2))))) - 1) mod (1 + 2)) + 1) + x, x, 2) - 1
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ 1 (+ x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (modf (- (modf (+ 2 (+ 2 x)) v1) 1) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (modf (- (modf (+ 2 (+ 2 x)) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (- (v2 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
