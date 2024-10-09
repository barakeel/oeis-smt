;; sequence(s): A175826
;; terms: 0 1 2 4 6 10 15 22 30 41 54 70 88 110 135 164 196 233 274 320
;; small program: loop((((y * y) - 1) div (2 * (2 + 2))) + x, x, x)
;; fast program: (((((1 + (2 + (x + x))) * (2 + (x * x))) div (2 * (2 * (2 + (2 + 2))))) + 1) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (- (* y y) 1) (* 2 (+ 2 2))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (divf (* (+ 1 (+ 2 (+ x x))) (+ 2 (* x x))) (* 2 (* 2 (+ 2 (+ 2 2))))) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
