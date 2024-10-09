;; sequence(s): A108598
;; terms: 1 3 5 7 9 10 12 14 16 18 19 21 23 25 27 28 30 32 34 36
;; small program: (loop(2 + (((y * y) div x) + y), 1 + x, 2) div 2) + x
;; fast program: ((1 - ((2 * (2 + (x + x))) div (1 + (2 * (2 + (2 * (2 + 2))))))) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (divf (* y y) x) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- 1 (divf (* 2 (+ 2 (+ x x))) (+ 1 (* 2 (+ 2 (* 2 (+ 2 2))))))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
