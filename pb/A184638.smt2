;; sequence(s): A184638
;; terms: 1 2 4 6 8 9 11 13 15 16 18 20 22 23 25 27 28 30 32 34
;; small program: (loop(y - ((x * y) div ((x + y) + y)), 2 + (x + x), 0) div 2) + x
;; fast program: (((2 + (2 - (((1 + x) div (2 + (2 * (2 + (2 + 2))))) + x))) div (2 + 2)) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (divf (* x y) (+ (+ x y) y))))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ 2 (- 2 (+ (divf (+ 1 x) (+ 2 (* 2 (+ 2 (+ 2 2))))) x))) (+ 2 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
