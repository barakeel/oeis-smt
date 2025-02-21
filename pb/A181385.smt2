;; sequence(s): A181385
;; terms: 0 1 2 3 4 7 9 13 16 21 25 31 36 43 49 57 64 73 81 91
;; small program: loop(1 + y, ((x * x) - 1) div (2 + 2), x)
;; fast program: (((x * x) - 1) div ((if (x - 2) <= 0 then 1 else 2) + 2)) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (g0 x) (divf (- (* x x) 1) (+ 2 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- (* x x) 1) (+ (ite (<= (- x 2) 0) 1 2) 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
