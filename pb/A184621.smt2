;; sequence(s): A184621
;; terms: 2 6 9 13 16 19 23 26 30 33 36 40 43 47 50 54 57 60 64 67
;; small program: (((loop((((y * y) + x) div (x + y)) + y, 2 + (x + x), 0) div 2) + 1) + x) + x
;; fast program: (((((2 + (2 + (((x div (2 + (2 * (2 + (2 + 2))))) + x) + x))) div (1 + (2 + 2))) + 2) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (+ (* y y) x) (+ x y)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (divf (v0 x) 2) 1) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (divf (+ 2 (+ 2 (+ (+ (divf x (+ 2 (* 2 (+ 2 (+ 2 2))))) x) x))) (+ 1 (+ 2 2))) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
