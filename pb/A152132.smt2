;; sequence(s): A152132
;; terms: 2 8 24 54 104 174 270 396 558 756 996 1282 1620 2010 2458 2968 3546 4192 4912 5710
;; small program: (1 + loop(((2 + y) * y) + x, x, x div (2 + 2))) * 2
;; fast program: (((((((1 + (2 * (2 + x))) * ((2 + x) * x)) div (1 + 2)) + (x div 2)) + 2) - x) div 2) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 2 y) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (divf x (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (v0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (* (divf (- (+ (+ (divf (* (+ 1 (* 2 (+ 2 x))) (* (+ 2 x) x)) (+ 1 2)) (divf x 2)) 2) x) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
