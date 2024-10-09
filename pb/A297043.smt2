;; sequence(s): A297043
;; terms: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1
;; small program: if loop((x div 2) - y, 2, x) <= 0 then 0 else 1
;; fast program: if (2 + ((2 * (2 + (2 + 2))) - x)) <= 0 then 1 else 0
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (divf x 2) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (ite (<= (v0 x) 0) 0 1))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (+ 2 (- (* 2 (+ 2 (+ 2 2))) x)) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
