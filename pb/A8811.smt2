;; sequence(s): A8811
;; terms: 0 1 2 3 4 7 10 13 16 21 26 31 36 43 50 57 64 73 82 91
;; small program: (loop(x + y, x, 1) div 2) - ((x div 2) div 2)
;; fast program: ((((2 - x) * (2 - x)) div (2 * (2 + 2))) * 2) + x
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
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (divf (v0 x) 2) (divf (divf x 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (divf (* (- 2 x) (- 2 x)) (* 2 (+ 2 2))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
