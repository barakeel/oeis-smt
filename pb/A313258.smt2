;; sequence(s): A313258
;; terms: 1 4 9 15 20 25 31 36 40 44 49 55 60 65 71 76 80 84 89 95
;; small program: (((((((loop((if ((y div 2) mod (2 + 2)) <= 0 then 1 else 2) + x, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x
;; fast program: (((((((((((((((((2 * (x mod (2 + 2))) + x) div (2 + 2)) + x) div 2) * 2) + 1) + x) div (1 + 2)) + x) * 2) + (if x <= 0 then 1 else x)) + x) * 2) + 1) + x) div (1 + 2)) + x
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (ite (<= (modf (divf y 2) (+ 2 2)) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (+ (* (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (+ (* (+ (+ (* (+ (divf (+ (+ (* (divf (+ (divf (+ (* 2 (modf x (+ 2 2))) x) (+ 2 2)) x) 2) 2) 1) x) (+ 1 2)) x) 2) (ite (<= x 0) 1 x)) x) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
