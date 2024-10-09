;; sequence(s): A190332
;; terms: 2 6 9 12 15 19 23 25 29 32 36 38 42 46 48 52 55 59 61 65
;; small program: ((((loop(((y * y) div (2 * (2 + x))) + y, 2 + (x + x), 0) * 2) * 2) - 1) - x) div (1 + 2)
;; fast program: (((((((((((2 - ((1 + x) div (2 + (2 * (2 + (2 + 2)))))) + x) div 2) + x) div 2) + x) * 2) * 2) + 1) div (1 + 2)) + 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* y y) (* 2 (+ 2 x))) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (- (- (* (* (v0 x) 2) 2) 1) x) (+ 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (* (* (+ (divf (+ (divf (+ (- 2 (divf (+ 1 x) (+ 2 (* 2 (+ 2 (+ 2 2)))))) x) 2) x) 2) x) 2) 2) 1) (+ 1 2)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
