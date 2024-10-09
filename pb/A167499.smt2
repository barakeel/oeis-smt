;; sequence(s): A167499
;; terms: 6 8 11 15 20 26 33 41 50 60 71 83 96 110 125 141 158 176 195 215
;; small program: 1 + (2 + loop(x + y, 1 + x, 2))
;; fast program: 1 + (2 + (2 + (((1 + x) * (2 + x)) div 2)))
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
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ 2 (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (+ 2 (divf (* (+ 1 x) (+ 2 x)) 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
