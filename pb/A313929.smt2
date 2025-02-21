;; sequence(s): A313929
;; terms: 1 5 10 16 22 28 34 40 46 52 57 62 67 72 78 84 90 96 102 108
;; small program: ((((loop(((((((2 + (x * x)) div (1 + 2)) mod (1 + 2)) + x) mod 2) + 1) + x, x, 1) - 1) + x) + (if x <= 0 then 1 else x)) + x) + x
;; fast program: ((((loop((((if (((x * x) mod (2 + (2 * (2 * (2 + 2))))) - 1) <= 0 then 2 else x) mod 2) + 1) + x, x - 1, 2) - 1) + x) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
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
(assert (forall ((x Int)) (= (f0 x) (+ (+ (modf (+ (modf (divf (+ 2 (* x x)) (+ 1 2)) (+ 1 2)) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (- (v0 x) 1) x) (ite (<= x 0) 1 x)) x) x))))
(assert (forall ((x Int)) (= (f1 x) (+ (+ (modf (ite (<= (- (modf (* x x) (+ 2 (* 2 (* 2 (+ 2 2))))) 1) 0) 2 x) 2) 1) x))))
(assert (forall ((x Int)) (= (g1 x) (- x 1))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (- (v1 x) 1) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
