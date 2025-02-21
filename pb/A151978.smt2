;; sequence(s): A151978
;; terms: 0 1 17 18 34 35 51 52 68 69 85 86 102 103 119 120 136 137 153 154
;; small program: ((loop(x * x, 2, 2) - 1) * (x div 2)) + x
;; fast program: ((1 + 2) * ((1 + (2 + 2)) * (x div 2))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (- v0 1) (divf x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (* (+ 1 (+ 2 2)) (divf x 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
