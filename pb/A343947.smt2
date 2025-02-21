;; sequence(s): A343947
;; terms: 9 6 5 4 4 4 3 3 3 3 3 3 3 3 3 3 3 3 3 3
;; small program: ((((loop(((loop(1 + (x * x), 2, 2) div (1 + x)) + 2) + x, 2, x) - x) div 2) + 1) div 2) + 1
;; fast program: ((((((((((((((((2 * (2 * (2 + 2))) - x) - (if x <= 0 then 1 else 2)) div 2) div 2) + 2) div 2) div 2) * 2) + 2) + x) * 2) + 1) - x) + x) + x) div (1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ 1 (* x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (divf v1 (+ 1 x)) 2) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (divf (- (v0 x) x) 2) 1) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (- (+ (* (+ (+ (* (divf (divf (+ (divf (divf (- (- (* 2 (* 2 (+ 2 2))) x) (ite (<= x 0) 1 2)) 2) 2) 2) 2) 2) 2) 2) x) 2) 1) x) x) x) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
