;; sequence(s): A158498
;; terms: 1 2 3 7 17 36 67 113 177 262 371 507 673 872 1107 1381 1697 2058 2467 2927
;; small program: 1 + (loop((x - 2) + y, x, 2) * x)
;; fast program: 1 + (((x - 2) * (((x * x) - x) div 2)) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x 2) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* (- x 2) (divf (- (* x x) x) 2)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
