;; sequence(s): A313685
;; terms: 1 5 10 15 19 23 28 33 38 43 48 53 57 61 66 71 76 81 86 91
;; small program: (((loop((((((2 * (x + x)) div y) + x) mod 2) + 1) + x, x, 2) - 1) + x) + x) + x
;; fast program: (((((((((1 + loop(1 - x, x div (2 + 2), 2)) + x) + x) + x) div 2) div (if x <= 0 then 1 else 2)) + x) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (modf (+ (divf (* 2 (+ x x)) y) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) x) x))))
(assert (forall ((x Int)) (= (f1 x) (- 1 x))))
(assert (forall ((x Int)) (= (g1 x) (divf x (+ 2 2)))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (divf (divf (+ (+ (+ (+ 1 (v1 x)) x) x) x) 2) (ite (<= x 0) 1 2)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
