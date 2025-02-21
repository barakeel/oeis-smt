;; sequence(s): A71039
;; terms: 1 1 1 1 1 1 1 0 1 1 1 1 0 1 1 1 1 1 1 0
;; small program: if (((loop((y div (x * x)) + x, x, 1) mod 2) + x) mod (2 + 2)) <= 0 then 0 else 1
;; fast program: (if ((((((((loop((if (y - x) <= 0 then y else 0) - x, 2 + loop(x * x, 2, 2), x) + 1) + x) mod 2) - (x mod 2)) mod 2) + (x mod 2)) + x) mod (2 + 2)) <= 0 then 2 else 1) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf y (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (ite (<= (modf (+ (modf (v0 x) 2) x) (+ 2 2)) 0) 0 1))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- (ite (<= (- y x) 0) y 0) x))))
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 2))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (= g1 (+ 2 v2)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (modf (ite (<= (modf (+ (+ (modf (- (modf (+ (+ (v1 x) 1) x) 2) (modf x 2)) 2) (modf x 2)) x) (+ 2 2)) 0) 2 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
