;; sequence(s): A133694
;; terms: 1 7 16 28 43 61 82 106 133 163 196 232 271 313 358 406 457 511 568 628
;; small program: 1 + ((1 + 2) * loop(x + y, x, x))
;; fast program: 1 + ((1 + 2) * ((((x * x) + x) div 2) + x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* (+ 1 2) (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (+ 1 2) (+ (divf (+ (* x x) x) 2) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
