;; sequence(s): A115
;; terms: 1 1 2 2 3 4 5 6 7 8 10 11 13 14 16 18 20 22 24 26
;; small program: ((loop((y div 2) + x, x, x) + x) div (1 + (2 + 2))) + 1
;; fast program: 1 + ((((2 * (2 + 2)) + x) * x) div (2 * (2 + (2 * (2 + 2)))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf y 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (v0 x) x) (+ 1 (+ 2 2))) 1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (divf (* (+ (* 2 (+ 2 2)) x) x) (* 2 (+ 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
