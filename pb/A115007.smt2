;; sequence(s): A115007
;; terms: 0 6 16 31 50 75 103 137 175 218 265 318 374 436 502 573 648 729 813 903
;; small program: (((loop(1 + ((2 + y) * x), 2, x) + x) + x) * (1 + x)) div (2 + (2 + 2))
;; fast program: (((1 + (x + x)) * ((2 * ((1 + 2) * (1 + x))) + x)) - 1) div (2 + (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* (+ 2 y) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (* (+ (+ (v0 x) x) x) (+ 1 x)) (+ 2 (+ 2 2))))))
(assert (forall ((x Int)) (= (fast x) (divf (- (* (+ 1 (+ x x)) (+ (* 2 (* (+ 1 2) (+ 1 x))) x)) 1) (+ 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
