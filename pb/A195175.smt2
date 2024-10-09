;; sequence(s): A195175
;; terms: 0 2 4 5 7 8 10 11 13 14 16 17 19 20 22 23 25 26 28 30
;; small program: ((((loop(x div (1 + 2), 2, x) div 2) - x) div 2) mod (1 + x)) + x
;; fast program: ((((x div (2 + (2 * (2 * (2 + 2))))) + x) div 2) + (if x <= 0 then 0 else 1)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (divf x (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (modf (divf (- (divf (v0 x) 2) x) 2) (+ 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (divf x (+ 2 (* 2 (* 2 (+ 2 2))))) x) 2) (ite (<= x 0) 0 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
