;; sequence(s): A315411
;; terms: 1 6 11 15 20 25 29 34 40 46 51 55 60 65 69 74 80 86 91 95
;; small program: (((((((loop((if ((y div 2) mod (2 + 2)) <= 0 then 2 else 1) + x, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)) * 2) + 1) div (1 + 2)) + x) + x
;; fast program: (((((((((((((if x <= 0 then 1 else x) - 1) div (2 * (2 + 2))) + x) + (x div (2 * (2 + 2)))) + x) * 2) + 2) + x) * 2) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (ite (<= (modf (divf y 2) (+ 2 2)) 0) 2 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (+ (* (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)) 2) 1) (+ 1 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (+ (* (+ (+ (* (+ (+ (+ (divf (- (ite (<= x 0) 1 x) 1) (* 2 (+ 2 2))) x) (divf x (* 2 (+ 2 2)))) x) 2) 2) x) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
