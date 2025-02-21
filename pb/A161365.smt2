;; sequence(s): A161365
;; terms: 9 9 19 19 29 29 39 39 49 49 59 59 69 69 79 79 89 89 99 99
;; small program: loop(((1 + x) * (y * y)) + x, 2, x div 2)
;; fast program: (2 * ((1 + (2 + 2)) * (1 + (x div 2)))) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 1 x) (* y y)) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* (+ 1 (+ 2 2)) (+ 1 (divf x 2)))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
