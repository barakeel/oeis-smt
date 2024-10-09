;; sequence(s): A329978
;; terms: 1 2 4 5 6 8 9 10 12 13 14 16 17 18 20 21 22 24 25 26
;; small program: loop((((y * y) - y) div (((y div 2) + x) + y)) + y, 1 + x, 0)
;; fast program: ((((2 * ((1 + 2) * (1 + x))) + x) div (2 * (2 + (2 * (2 + 2))))) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (- (* y y) y) (+ (+ (divf y 2) x) y)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (* 2 (* (+ 1 2) (+ 1 x))) x) (* 2 (+ 2 (* 2 (+ 2 2))))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
