;; sequence(s): A300403
;; terms: 0 0 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
;; small program: 2 - ((2 + (x div 2)) div (if x <= 0 then 1 else x))
;; fast program: if ((x - 2) - 2) <= 0 then loop(0, 2 - x, 1) else 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- 2 (divf (+ 2 (divf x 2)) (ite (<= x 0) 1 x))))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (- x 2) 2) 0) (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
