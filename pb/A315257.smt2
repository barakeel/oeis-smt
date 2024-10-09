;; sequence(s): A315257
;; terms: 1 6 10 15 20 24 30 36 40 45 50 54 60 66 70 75 80 84 90 96
;; small program: (((((((1 + x) mod (2 + (x mod 2))) - 1) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
;; fast program: (((loop((((1 + (if x <= 0 then 1 else x)) mod (1 + 2)) - 1) + x, x mod 2, x) + x) + (if x <= 0 then 1 else x)) + x) + x
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (- (modf (+ 1 x) (+ 2 (modf x 2))) 1) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (forall ((x Int)) (= (f0 x) (+ (- (modf (+ 1 (ite (<= x 0) 1 x)) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (modf x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (v0 x) x) (ite (<= x 0) 1 x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
