;; sequence(s): A184518
;; terms: 1 3 4 5 6 7 9 10 11 12 14 15 16 17 19 20 21 22 24 25
;; small program: (loop(1 + ((y * y) div (x + y)), (2 * (x + x)) + 1, 1) div 2) + 1
;; fast program: ((((((((((((((((x + x) div (1 + (2 + (2 * (2 * (2 + 2)))))) + x) div 2) + 2) - x) div 2) div 2) div 2) + 1) + x) div 2) + 1) + x) + x) div 2) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (divf (* y y) (+ x y))))))
(assert (forall ((x Int)) (= (g0 x) (+ (* 2 (+ x x)) 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (+ (+ (divf (+ (+ (divf (divf (divf (- (+ (divf (+ (divf (+ x x) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))) x) 2) 2) x) 2) 2) 2) 1) x) 2) 1) x) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
