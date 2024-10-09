;; sequence(s): A313119
;; terms: 1 4 9 14 19 24 30 36 41 46 51 56 60 64 69 74 79 84 90 96
;; small program: (((((((((((((loop((((loop(((1 + x) div (1 + 2)) + x, 2, x) + x) mod 2) + 1) + x, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) div (1 + 2)) + x
;; fast program: ((((((((((((loop((((loop(((1 + x) div (1 + 2)) + x, 2, x) + x) mod 2) + 1) + x, x - 1, 2) - 1) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) div (1 + 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ (divf (+ 1 x) (+ 1 2)) x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (modf (+ (v1 x) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (* (+ (divf (+ (+ (* (+ (+ (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)) x) x) 2) 1) x) (+ 1 2)) x) 2) 1) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (f3 x) (+ (divf (+ 1 x) (+ 1 2)) x))))
(assert (= g3 2))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (modf (+ (v3 x) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g2 x) (- x 1))))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (* (+ (divf (+ (+ (* (* (+ (+ (- (v2 x) 1) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) 2) 1) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
