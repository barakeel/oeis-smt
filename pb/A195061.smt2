;; sequence(s): A195061
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; small program: if ((loop(x + y, ((x - 2) div 2) div 2, 1) - x) * x) <= 0 then 1 else 2
;; fast program: if ((x - 1) - (2 * (2 * ((2 + 2) - ((0 - x) div (((2 + 2) * 2) + 1)))))) <= 0 then 1 else 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (divf (divf (- x 2) 2) 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (ite (<= (* (- (v0 x) x) x) 0) 1 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (- x 1) (* 2 (* 2 (- (+ 2 2) (divf (- 0 x) (+ (* (+ 2 2) 2) 1)))))) 0) 1 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
