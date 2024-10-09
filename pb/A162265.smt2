;; sequence(s): A162265
;; terms: 1 13 42 94 175 291 448 652 909 1225 1606 2058 2587 3199 3900 4696 5593 6597 7714 8950
;; small program: ((1 + (x + x)) * loop(2 + (x + y), x, 1)) + x
;; fast program: ((1 + (x + x)) * ((((1 + x) * (2 + x)) div 2) + x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 (+ x x)) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ x x)) (+ (divf (* (+ 1 x) (+ 2 x)) 2) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
