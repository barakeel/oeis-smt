;; sequence(s): A162762
;; terms: 0 2 4 6 8 14 18 22 26 34 40 46 52 62 70 78 86
;; small program: ((loop(((y div 2) + (x mod 2)) + x, x - 2, x) + x) div 2) * 2
;; fast program: (((((((((((((1 + (((x * x) div (2 + 2)) + x)) + x) + x) div (if x <= 0 then 1 else 2)) * (if x <= 0 then 1 else 2)) - 1) - x) - x) * 2) + 1) + x) div 2) div 2) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (divf y 2) (modf x 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (divf (+ (v0 x) x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (* (divf (divf (+ (+ (* (- (- (- (* (divf (+ (+ (+ 1 (+ (divf (* x x) (+ 2 2)) x)) x) x) (ite (<= x 0) 1 2)) (ite (<= x 0) 1 2)) 1) x) x) 2) 1) x) 2) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
