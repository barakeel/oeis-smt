;; sequence(s): A249244
;; terms: 3 7 11 15 19 22 26 30 34 38 41 45 49 53 56 60 64 68 72 75
;; small program: (1 + 2) + ((2 * (x + x)) - (((x div 2) + x) div (1 + (2 + (2 + 2)))))
;; fast program: ((1 + loop(x - (x div (2 + (2 * (2 + (2 + 2))))), 1, (x + x) + x)) + x) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 1 2) (- (* 2 (+ x x)) (divf (+ (divf x 2) x) (+ 1 (+ 2 (+ 2 2)))))))))
(assert (forall ((x Int)) (= (f0 x) (- x (divf x (+ 2 (* 2 (+ 2 (+ 2 2)))))))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ (+ x x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ 1 (v0 x)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
