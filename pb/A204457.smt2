;; sequence(s): A204457
;; terms: 1 3 5 7 9 11 15 17 19 21 23 25 27 29 31 33 35 37 41 43
;; small program: (2 * (loop((2 - x) div (2 + y), 2, x) + x)) + 1
;; fast program: 1 + (2 * (((1 + (x div (2 + (2 + 2)))) div 2) + x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (- 2 x) (+ 2 y)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (+ (v0 x) x)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (+ (divf (+ 1 (divf x (+ 2 (+ 2 2)))) 2) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
