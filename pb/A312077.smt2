;; sequence(s): A312077
;; terms: 1 4 8 13 18 22 26 31 36 40 44 48 52 57 62 66 70 75 80 84
;; small program: (((loop((((if (((x * x) mod (1 + (2 + (2 + 2)))) - 1) <= 0 then 0 else x) mod 2) + 1) + x, x - 1, 2) - 1) + x) + x) + x
;; fast program: ((((((((((((((((((x mod (2 + (2 * (2 + 2)))) + x) + x) + x) div (1 + (2 + 2))) + x) * 2) + (if x <= 0 then 1 else x)) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) + x) div (if x <= 0 then 1 else 2)
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
(assert (forall ((x Int)) (= (f0 x) (+ (+ (modf (ite (<= (- (modf (* x x) (+ 1 (+ 2 (+ 2 2)))) 1) 0) 0 x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (+ (+ (+ (divf (+ (+ (* (+ (+ (* (+ (divf (+ (+ (+ (modf x (+ 2 (* 2 (+ 2 2)))) x) x) x) (+ 1 (+ 2 2))) x) 2) (ite (<= x 0) 1 x)) x) 2) 1) x) (+ 1 2)) x) x) x) x) x) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
