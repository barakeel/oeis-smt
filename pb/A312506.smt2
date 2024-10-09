;; sequence(s): A312506
;; terms: 1 4 8 14 18 22 28 32 36 40 44 50 54 58 64 68 72 76 80 86
;; small program: (((loop((((x div 2) mod 2) + x) div 2, 2, x) + x) * 2) + (if x <= 0 then 1 else x)) + x
;; fast program: (((((2 * ((x - (x div (2 * (2 + 2)))) + x)) div (1 + 2)) + x) * 2) + 2) - (if x <= 0 then 1 else 2)
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
(assert (forall ((x Int)) (= (f0 x) (divf (+ (modf (divf x 2) 2) x) 2))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ (v0 x) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (- (+ (* (+ (divf (* 2 (+ (- x (divf x (* 2 (+ 2 2)))) x)) (+ 1 2)) x) 2) 2) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
