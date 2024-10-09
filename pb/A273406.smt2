;; sequence(s): A273406
;; terms: 1 5 26 70 147 263 428 648 933 1289 1726 2250 2871 3595 4432 5388 6473 7693 9058 10574
;; small program: ((((loop(((y * y) + x) + y, x, 0) - x) * 2) * 2) + 1) + (x div 2)
;; fast program: (((((((x * x) * x) - x) div (1 + 2)) + (x * x)) * (2 + 2)) + 1) + (x div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* y y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (* (- (v0 x) x) 2) 2) 1) (divf x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (divf (- (* (* x x) x) x) (+ 1 2)) (* x x)) (+ 2 2)) 1) (divf x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
