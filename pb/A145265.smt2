;; sequence(s): A145265
;; terms: 1 4 5 8 15 18 19 22 23 26 33 36 37 40 41 44 51 54 55 58
;; small program: ((loop(1 - (2 div x), x div 2, 1) + x) + x) + x
;; fast program: (((((1 - (x div 2)) mod (1 + 2)) + x) * 2) - 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 1 (divf 2 x)))))
(assert (forall ((x Int)) (= (g0 x) (divf x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (+ (modf (- 1 (divf x 2)) (+ 1 2)) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
