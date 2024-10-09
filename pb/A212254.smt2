;; sequence(s): A212254
;; terms: 0 0 0 1 4 11 21 37 59 88 125 172 228 296 376 469 576 699 837 993
;; small program: ((loop(((y - 2) * y) + x, x, 2) * x) div 2) div (1 + x)
;; fast program: (((((2 * (x - 2)) - 1) * (x * x)) - 1) div (2 * (2 + (2 + 2)))) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (- y 2) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (divf (* (v0 x) x) 2) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- (* (- (* 2 (- x 2)) 1) (* x x)) 1) (* 2 (+ 2 (+ 2 2)))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
