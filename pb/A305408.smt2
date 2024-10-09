;; sequence(s): A305408
;; terms: 1 6 11 16 18 23 28 33 35 40 45 50 52 57 62 67 69 74 79 84
;; small program: (((((1 - ((2 * (2 + (x + x))) div (1 + loop(x * x, 2, 2)))) + x) + x) * (1 + 2)) - 2) - x
;; fast program: (((((1 - ((2 * (2 + (x + x))) div (1 + (2 * (2 * (2 + 2)))))) + x) * (1 + 2)) - 2) + x) + x
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
(assert (forall ((x Int)) (= (small x) (- (- (* (+ (+ (- 1 (divf (* 2 (+ 2 (+ x x))) (+ 1 v0))) x) x) (+ 1 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (* (+ (- 1 (divf (* 2 (+ 2 (+ x x))) (+ 1 (* 2 (* 2 (+ 2 2)))))) x) (+ 1 2)) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
