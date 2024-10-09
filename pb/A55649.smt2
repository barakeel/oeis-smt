;; sequence(s): A55649
;; terms: 0 1 2 3 4 5 6 7 8 9 10 100 101 102 103 104 105 106 107 108
;; small program: (loop(1 + (x * y), 2 + 2, 2) * (x div (1 + (2 + (2 * (2 + 2)))))) + x
;; fast program: ((1 + (2 * (2 * (2 + (2 * (2 + (2 * (2 + 2)))))))) * (x div (1 + (2 + (2 * (2 + 2)))))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* x y)))))
(assert (= g0 (+ 2 2)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* v0 (divf x (+ 1 (+ 2 (* 2 (+ 2 2)))))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 (* 2 (+ 2 2)))))))) (divf x (+ 1 (+ 2 (* 2 (+ 2 2)))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
