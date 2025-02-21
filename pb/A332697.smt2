;; sequence(s): A332697
;; terms: 0 4 19 56 130 260 469 784 1236 1860 2695 3784 5174 6916 9065 11680 14824 18564 22971 28120
;; small program: loop(1 + (((((x + x) + x) div y) + x) - y), x, x)
;; fast program: ((1 + (2 + ((2 + x) * (2 + x)))) * ((x * x) + x)) div (2 + (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- (+ (divf (+ (+ x x) x) y) x) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ 1 (+ 2 (* (+ 2 x) (+ 2 x)))) (+ (* x x) x)) (+ 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
