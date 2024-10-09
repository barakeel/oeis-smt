;; sequence(s): A7851
;; terms: 1 4 14 48 167 593 2144 7864 29171 109173 411501 1560089 5943199 22732739 87253604 335897864 1296447899 5015206349 19439895089 75487384829
;; small program: (loop((((1 + 2) * (x * y)) div (2 + y)) + x, x, 2 + (2 + x)) div 2) - 1
;; fast program: ((loop(2 * (((x div y) + x) + x), x, 2 + (2 + x)) div (1 + x)) div (2 + x)) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* (+ 1 2) (* x y)) (+ 2 y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (+ 2 (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (divf (v0 x) 2) 1))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (+ (divf x y) x) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) (+ 2 (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (divf (divf (v1 x) (+ 1 x)) (+ 2 x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
