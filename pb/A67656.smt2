;; sequence(s): A67656
;; terms: 7 13 17 19 24 25 27 31 32 34 37 38 43 45 47 49 55 57 59 61
;; small program: compr(loop(x * y, x, 1) mod loop(1 + (x + y), x + x, 1), 1 + x)
;; fast program: compr(loop(x * y, x - (x div (1 + 2)), 1) mod ((1 + (x + x)) * (1 + x)), 1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g2 x) (+ x x))))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (f0 x) (modf (v1 x) (v2 x)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* x y))))
(assert (forall ((x Int)) (= (g4 x) (- x (divf x (+ 1 2))))))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (f3 x) (modf (v4 x) (* (+ 1 (+ x x)) (+ 1 x))))))
(assert (forall ((x Int)) (= (g3 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x)))))
(assert (forall ((x Int)) (= (fast x) (v3 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
