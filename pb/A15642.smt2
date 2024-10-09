;; sequence(s): A15642
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; small program: (2 - ((1 + x) div loop((2 + y) * x, 2, 2))) div 2
;; fast program: (2 - ((1 + x) div (2 * (2 * (2 + (2 + 2)))))) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (divf (- 2 (divf (+ 1 x) v0)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (- 2 (divf (+ 1 x) (* 2 (* 2 (+ 2 (+ 2 2)))))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
