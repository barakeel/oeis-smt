;; sequence(s): A138235
;; terms: 1 3 5 6 8 10 11 13 15 16 18 20 21 23 25 27 28 30 32 33
;; small program: ((1 - ((x - (x div loop(2 + (x + x), 2, 2))) div (1 + 2))) + x) + x
;; fast program: (1 + (x - ((x - (x div (2 + (2 * (2 + (2 + 2)))))) div (1 + 2)))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 2 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (- 1 (divf (- x (divf x v0)) (+ 1 2))) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (- x (divf (- x (divf x (+ 2 (* 2 (+ 2 (+ 2 2)))))) (+ 1 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
