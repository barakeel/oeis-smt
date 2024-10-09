;; sequence(s): A187322
;; terms: 0 0 2 3 5 5 7 8 10 10 12 13 15 15 17 18 20 20 22 23
;; small program: loop((x div 2) + x, 2, x) - x
;; fast program: (((1 + 2) * (x div 2)) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (divf x 2) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (* (+ 1 2) (divf x 2)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
