;; sequence(s): A3153
;; terms: 2 5 7 10 12 14 17 19 22 24 27 29 31 34 36 39 41 43 46 48
;; small program: loop(2 + (y div x), (x + x) * (2 + x), 2) + x
;; fast program: (((((1 - ((x - (x div (1 + (2 + (2 + 2))))) div (1 + (2 + 2)))) + x) div 2) + 2) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (divf y x)))))
(assert (forall ((x Int)) (= (g0 x) (* (+ x x) (+ 2 x)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (+ (- 1 (divf (- x (divf x (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2)))) x) 2) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
