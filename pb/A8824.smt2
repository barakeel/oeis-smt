;; sequence(s): A8824
;; terms: 1 2 3 4 7 10 13 18 23 28 33 40 47 54 63 72 81 90 101 112
;; small program: loop((((y + y) div (1 + (2 + (2 + 2)))) * 2) + x, x, 1) + x
;; fast program: ((((1 + ((x - 2) * x)) div (1 + (2 + (2 + 2)))) * 2) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (divf (+ y y) (+ 1 (+ 2 (+ 2 2)))) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (divf (+ 1 (* (- x 2) x)) (+ 1 (+ 2 (+ 2 2)))) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
