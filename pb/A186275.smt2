;; sequence(s): A186275
;; terms: 2 3 4 6 7 9 10 11 13 14 16 17 18 20 21 23 24 25 27 28
;; small program: (((((((loop((x div (2 + 2)) + x, 2, x) div (2 + (2 + 2))) + x) div 2) + x) div 2) div 2) + x) + 2
;; fast program: (((((((x div (2 + (2 * (2 + 2)))) + (x div (2 * (2 + 2)))) div (2 + (2 + 2))) + x) + x) div (1 + (2 + 2))) + x) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (divf x (+ 2 2)) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (divf (+ (divf (+ (divf (v0 x) (+ 2 (+ 2 2))) x) 2) x) 2) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (+ (divf (+ (divf x (+ 2 (* 2 (+ 2 2)))) (divf x (* 2 (+ 2 2)))) (+ 2 (+ 2 2))) x) x) (+ 1 (+ 2 2))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
