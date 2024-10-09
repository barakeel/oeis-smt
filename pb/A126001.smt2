;; sequence(s): A126001
;; terms: 0 1 4 5 8 9 12 13 16 17 20 21 24 25 28 29 64 65 68 69
;; small program: ((((x div 2) - (x mod loop(x * x, 2, 2))) + x) * 2) + x
;; fast program: ((((x div 2) - (x mod (2 * (2 * (2 + 2))))) + x) * 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
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
(assert (forall ((x Int)) (= (small x) (+ (* (+ (- (divf x 2) (modf x v0)) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (- (divf x 2) (modf x (* 2 (* 2 (+ 2 2))))) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
