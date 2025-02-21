;; sequence(s): A76770
;; terms: 18 24 30 34 36 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68
;; small program: ((((((((((((loop(((((((2 * (2 + (2 + 2))) + 1) * (if x <= 0 then 1 else 2)) - x) + 1) div (1 + 2)) + x, x, 1) + 2) + 2) + 2) + 2) + 2) div 2) + 2) div 2) + 2) + 2) + 2) + x) * 2
;; fast program: (((((((((((((loop(x + x, x, 1 + (2 + (2 + 2))) - 2) - 2) * (2 + 2)) + 1) + loop(x + x, x, 1 + 2)) - 2) - x) + 2) - x) - x) + 2) div loop(x + x, x, 2)) + x) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
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
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (divf (+ (- (* (+ (* 2 (+ 2 (+ 2 2))) 1) (ite (<= x 0) 1 2)) x) 1) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ (+ (+ (+ (divf (+ (divf (+ (+ (+ (+ (+ (v0 x) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) x) 2))))
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 (+ 1 (+ 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (f3 x) (+ x x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 2))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (fast x) (* (+ (divf (+ (- (- (+ (- (- (+ (+ (* (- (- (v1 x) 2) 2) (+ 2 2)) 1) (v2 x)) 2) x) 2) x) x) 2) (v3 x)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
