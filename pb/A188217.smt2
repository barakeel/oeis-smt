;; sequence(s): A188217
;; terms: 3 4 8 12 16 20 21 25 29 33 37 38 42 46 50 54 55 59 63 67
;; small program: ((loop(2 + (((y * y) div x) + y), x, 2) div 2) * (1 + 2)) + x
;; fast program: ((if x <= 0 then 1 else (x - (((2 + 2) * x) div ((((((2 + 2) + 2) + 2) + 2) * 2) + 1)))) * (1 + 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (divf (* y y) x) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (divf (v0 x) 2) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (ite (<= x 0) 1 (- x (divf (* (+ 2 2) x) (+ (* (+ (+ (+ (+ 2 2) 2) 2) 2) 2) 1)))) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
