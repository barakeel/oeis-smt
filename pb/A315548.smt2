;; sequence(s): A315548
;; terms: 1 6 11 17 23 29 35 41 47 53 58 64 70 75 81 87 93 99 105 111
;; small program: ((((((((((((((2 * (x + x)) + x) div loop(1 + (x + x), 2, 2)) + 1) + x) div (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) + x
;; fast program: ((((((((((((((2 * (x + x)) + x) div (1 + (2 + (2 * (2 + 2))))) + 1) + x) div (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (divf (+ (+ (* (divf (+ (+ (divf (+ (* 2 (+ x x)) x) v0) 1) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (divf (+ (+ (* (divf (+ (+ (divf (+ (* 2 (+ x x)) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
