;; sequence(s): A23810
;; terms: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 18 19 20
;; small program: (((if x <= 0 then 1 else x) - 1) div loop(x * x, 2, 2)) + x
;; fast program: (((if x <= 0 then 1 else x) - 1) div (2 * (2 * (2 + 2)))) + x
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
(assert (forall ((x Int)) (= (small x) (+ (divf (- (ite (<= x 0) 1 x) 1) v0) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- (ite (<= x 0) 1 x) 1) (* 2 (* 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
