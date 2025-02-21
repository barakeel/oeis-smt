;; sequence(s): A109622
;; terms: 1 1 4 7 15 23 38 53 77 101 136 171 219 267 330 393 473 553 652 751
;; small program: loop(((2 + (y div 2)) * (y div 2)) + x, x, 1)
;; fast program: (((((1 + x) * ((2 + x) * x)) div (2 + (2 + 2))) + ((x div 2) * x)) div 2) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 2 (divf y 2)) (divf y 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (divf (* (+ 1 x) (* (+ 2 x) x)) (+ 2 (+ 2 2))) (* (divf x 2) x)) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
