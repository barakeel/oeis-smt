;; sequence(s): A259474
;; terms: 0 1 6 21 55 120 231 406 665 1035 1540 2211
;; small program: ((((((((loop(loop(x + y, (y * 2) + y, x), x, 1) + x) div 2) - 1) + x) * x) div 2) + 1) + x) div (1 + 2)
;; fast program: ((((((((1 + ((1 + 2) * (((x * x) + x) div 2))) * (1 + x)) div 2) + 1) + x) * x) div (1 + 2)) + 1) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ (* y 2) y))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (+ (+ (divf (* (+ (- (divf (+ (v0 x) x) 2) 1) x) x) 2) 1) x) (+ 1 2)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (divf (* (+ (+ (divf (* (+ 1 (* (+ 1 2) (divf (+ (* x x) x) 2))) (+ 1 x)) 2) 1) x) x) (+ 1 2)) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
