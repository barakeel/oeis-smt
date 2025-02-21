;; sequence(s): A47285
;; terms: 0 2 3 6 7 9 10 13 14 16 17 20 21 23 24 27 28 30 31 34
;; small program: (x - (loop(y - x, x, 1) div 2)) + x
;; fast program: (((1 + 2) * (x - (x div 2))) div 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- x (divf (v0 x) 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (* (+ 1 2) (- x (divf x 2))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
