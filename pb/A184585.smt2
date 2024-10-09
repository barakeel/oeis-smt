;; sequence(s): A184585
;; terms: 2 4 6 7 9 11 13 15 16 18 20 22 24 25 27 29 31 33 34 36
;; small program: (((loop(((y * y) div (2 + x)) + y, 1 + (x + x), 0) div 2) div 2) + 2) + x
;; fast program: ((((2 * (2 + (2 * (x + x)))) + (x div (1 + (2 + (2 * (2 + 2)))))) div (2 + (2 * (2 + 2)))) + 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (divf (v0 x) 2) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (* 2 (+ 2 (* 2 (+ x x)))) (divf x (+ 1 (+ 2 (* 2 (+ 2 2)))))) (+ 2 (* 2 (+ 2 2)))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
