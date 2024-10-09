;; sequence(s): A174028
;; terms: 2 2 6 2 6 10 2 6 10 14 2 6 10 14 18 2 6 10 14 18
;; small program: ((loop(x - (if (y - x) <= 0 then y else 0), x, x) * 2) * 2) + 2
;; fast program: ((loop(x - (if (y - x) <= 0 then y else 0), 2 + (x div (2 + 2)), x) * 2) + 1) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x (ite (<= (- y x) 0) y 0)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (* (v0 x) 2) 2) 2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- x (ite (<= (- y x) 0) y 0)))))
(assert (forall ((x Int)) (= (g1 x) (+ 2 (divf x (+ 2 2))))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* (v1 x) 2) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
