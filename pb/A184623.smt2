;; sequence(s): A184623
;; terms: 4 7 11 14 17 21 24 28 31 34 38 41 45 48 52 55 58 62 65 69
;; small program: (((loop((((y * y) div x) + y) + y, x + x, 1) div 2) + 2) + 2) + x
;; fast program: ((((((1 + ((((1 + x) div (2 + (2 * (2 + (2 + 2))))) + x) + x)) div (1 + (2 + 2))) + 2) + 2) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (divf (* y y) x) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (divf (v0 x) 2) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (divf (+ 1 (+ (+ (divf (+ 1 x) (+ 2 (* 2 (+ 2 (+ 2 2))))) x) x)) (+ 1 (+ 2 2))) 2) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
