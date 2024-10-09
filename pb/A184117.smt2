;; sequence(s): A184117
;; terms: 1 2 3 5 6 8 9 11 12 13 15 16 18 19 20 22 23 25 26 27
;; small program: loop(((y * y) + x) div ((x + y) + y), 2 + x, 0) + x
;; fast program: (((((((((x div (2 + 2)) + x) div (2 + 2)) + 1) + x) div 2) + x) div (2 + 2)) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (+ (* y y) x) (+ (+ x y) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (divf (+ (+ (divf (+ (divf x (+ 2 2)) x) (+ 2 2)) 1) x) 2) x) (+ 2 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
