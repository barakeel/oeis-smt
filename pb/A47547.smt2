;; sequence(s): A47547
;; terms: 0 2 3 4 7 8 10 11 12 15 16 18 19 20 23 24 26 27 28 31
;; small program: loop((((x + y) * y) div (2 + (2 + y))) + x, 2, x)
;; fast program: (((1 + 2) * (1 + (((x - 2) + x) div (1 + (2 + 2))))) div 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* (+ x y) y) (+ 2 (+ 2 y))) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (* (+ 1 2) (+ 1 (divf (+ (- x 2) x) (+ 1 (+ 2 2))))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
