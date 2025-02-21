;; sequence(s): A212674
;; terms: 0 1 8 35 104 247 504 925 1568 2501 3800 5551 7848 10795 14504 19097 24704 31465 39528 49051
;; small program: loop(((x - (y div 2)) + y) + y, x * x, 0) div 2
;; fast program: ((1 + ((1 + 2) * (x * x))) * (1 + (x * x))) div (2 * (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (- x (divf y 2)) y) y))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ 1 (* (+ 1 2) (* x x))) (+ 1 (* x x))) (* 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
