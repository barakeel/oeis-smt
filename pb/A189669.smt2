;; sequence(s): A189669
;; terms: 1 3 5 6 7 9 11 12 13 15 16 18 19 21 23 24 25 27 29 30
;; small program: compr(((loop(if ((x mod (1 + 2)) - 1) <= 0 then (x div (1 + 2)) else x, x, x) + x) mod 2) div 1, x) + 1
;; fast program: (((((((((loop(((((((((loop(if ((x mod (1 + 2)) - 1) <= 0 then (x div (1 + 2)) else x, 2 + 2, x) + x) mod 2) + 1) + x) + x) * 2) + 1) - x) - x, 1, x div 2) + x) div 2) + 2) + x) + 2) - x) + x) + x) div 2) - 1
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
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (ite (<= (- (modf x (+ 1 2)) 1) 0) (divf x (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (divf (modf (+ (v1 x) x) 2) 1))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 1))))
(assert (forall ((x Int)) (= (f3 x) (ite (<= (- (modf x (+ 1 2)) 1) 0) (divf x (+ 1 2)) x))))
(assert (= g3 (+ 2 2)))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (- (- (+ (* (+ (+ (+ (modf (+ (v3 x) x) 2) 1) x) x) 2) 1) x) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (divf (+ (+ (- (+ (+ (+ (divf (+ (v2 x) x) 2) 2) x) 2) x) x) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
