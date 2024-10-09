;; sequence(s): A186224
;; terms: 2 4 7 10 12 15 18 21 23 26 29 32 34 37 40 42 45 48 51 53
;; small program: loop((((y + y) * y) div ((x + 1) + y)) + y, 1 + x, 0) + x
;; fast program: ((((((((((((((((x div 2) div 2) div 2) + x) div 2) + x) + (x div (1 + (2 + (2 + 2))))) div 2) + x) div 2) + x) + x) div 2) div 2) + x) + x) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* (+ y y) y) (+ (+ x 1) y)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (divf (+ (+ (divf (+ (divf (+ (+ (divf (+ (divf (divf (divf x 2) 2) 2) x) 2) x) (divf x (+ 1 (+ 2 (+ 2 2))))) 2) x) 2) x) x) 2) 2) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
