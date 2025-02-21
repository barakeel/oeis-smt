;; sequence(s): A178073
;; terms: 1 10 41 116 265 526 945 1576 2481 3730 5401 7580 10361 13846 18145 23376 29665 37146 45961 56260
;; small program: 1 + (loop(((y * y) + x) + y, x, x) * (2 + x))
;; fast program: (((((1 + x) * ((2 + x) * x)) div (1 + 2)) + x) * (2 + x)) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* y y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* (v0 x) (+ 2 x))))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (divf (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2)) x) (+ 2 x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
