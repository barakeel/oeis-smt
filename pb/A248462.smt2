;; sequence(s): A248462
;; terms: 6 18 48 96 174 282 432 624 870 1170 1536 1968 2478 3066 3744 4512 5382 6354 7440 8640
;; small program: loop(((2 + (y * y)) * y) - x, 1 + x, 0) * 2
;; fast program: (((((1 + (x + x)) * ((2 + x) * (2 + x))) div (2 + 2)) + 2) + x) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* (+ 2 (* y y)) y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (* (+ (+ (divf (* (+ 1 (+ x x)) (* (+ 2 x) (+ 2 x))) (+ 2 2)) 2) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
