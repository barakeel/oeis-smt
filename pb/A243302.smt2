;; sequence(s): A243302
;; terms: 1 3 4 6 9 11 14 18 21 25
;; small program: 1 + ((loop(x + y, x, 2) div (1 + 2)) + x)
;; fast program: 1 + (x - ((0 - ((x * x) + x)) div (2 + (2 + 2))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (divf (v0 x) (+ 1 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (- x (divf (- 0 (+ (* x x) x)) (+ 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
