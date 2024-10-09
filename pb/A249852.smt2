;; sequence(s): A249852
;; terms: 0 2 7 14 23 35 50 67 86 108 133 160 189 221 256 293 332 374 419 466
;; small program: ((x * x) - (loop(x - y, x, x) div 2)) + x
;; fast program: ((x * x) - ((x - (x * x)) div (2 + 2))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (- (* x x) (divf (v0 x) 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* x x) (divf (- x (* x x)) (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
