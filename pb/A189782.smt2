;; sequence(s): A189782
;; terms: 2 4 8 10 14 16 20 22 26 28 30 34 36 40 42 46 48 52 54 58
;; small program: ((((2 - ((1 + ((x div 2) + x)) div loop(x * x, 2, 2))) + x) div 2) + x) * 2
;; fast program: ((((2 - ((2 + ((x + x) + x)) div (2 * (2 * (2 * (2 + 2)))))) + x) div 2) + x) * 2
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
(assert (forall ((x Int)) (= (small x) (* (+ (divf (+ (- 2 (divf (+ 1 (+ (divf x 2) x)) v0)) x) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (* (+ (divf (+ (- 2 (divf (+ 2 (+ (+ x x) x)) (* 2 (* 2 (* 2 (+ 2 2)))))) x) 2) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
