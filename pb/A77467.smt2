;; sequence(s): A77467
;; terms: 1 2 2 3 3 4 5 5 6 6 7 8 8 9 9 10 10 11 12 12
;; small program: ((((((if (x - loop(x * x, 2, 2)) <= 0 then 1 else 2) + x) div (2 + (2 + 2))) + 1) + x) div 2) + 1
;; fast program: ((((((if (x - (2 * (2 * (2 + 2)))) <= 0 then 1 else 2) + x) div (2 + (2 + 2))) + 1) + x) div 2) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (+ (divf (+ (ite (<= (- x v0) 0) 1 2) x) (+ 2 (+ 2 2))) 1) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (+ (divf (+ (ite (<= (- x (* 2 (* 2 (+ 2 2)))) 0) 1 2) x) (+ 2 (+ 2 2))) 1) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
