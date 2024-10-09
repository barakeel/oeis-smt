;; sequence(s): A313416
;; terms: 1 5 10 13 18 25 28 31 38 43 46 51 56 61 66 69 74 81 84 87
;; small program: (((((((((((((loop((((if (x mod (1 + 2)) <= 0 then 2 else x) mod 2) + 1) + x, x, 1) - 1) + x) + (if x <= 0 then 1 else x)) + x) * (1 + 2)) + 1) + x) div (1 + 2)) - x) - x) * (if x <= 0 then 1 else 2)) + 2) - x) - 2
;; fast program: (((((((((((((((((((1 + ((((x div (2 + (2 + 2))) mod 2) + x) + x)) + x) div (2 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) * (1 + 2)) + 1) + x) div (1 + 2)) - x) - x) * (if x <= 0 then 1 else 2)) - x
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
(assert (forall ((x Int)) (= (f0 x) (+ (+ (modf (ite (<= (modf x (+ 1 2)) 0) 2 x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (- (+ (* (- (- (divf (+ (+ (* (+ (+ (+ (- (v0 x) 1) x) (ite (<= x 0) 1 x)) x) (+ 1 2)) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* (- (- (divf (+ (+ (* (+ (divf (+ (+ (* (+ (+ (+ (+ (divf (+ (+ 1 (+ (+ (modf (divf x (+ 2 (+ 2 2))) 2) x) x)) x) (+ 2 2)) (ite (<= x 0) 1 x)) x) x) x) 2) 1) x) (+ 1 2)) x) (+ 1 2)) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
