;; sequence(s): A47460
;; terms: 0 1 3 4 8 9 11 12 16 17 19 20 24 25 27 28 32 33 35 36
;; small program: x + compr((x div 2) mod 2, x div 2)
;; fast program: (x - loop(y - x, x mod (2 + 2), 0)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (modf (divf x 2) 2))))
(assert (forall ((x Int)) (= (g0 x) (divf x 2))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (+ x (v0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- y x))))
(assert (forall ((x Int)) (= (g1 x) (modf x (+ 2 2)))))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (v1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
