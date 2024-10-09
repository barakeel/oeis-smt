;; sequence(s): A304497
;; terms: 1 3 6 8 10 13 15 17 20 22 24 27 29 31 34 36 38 41 43 45
;; small program: (loop(((if (x mod (1 + (2 * (2 * (2 - (x mod 2)))))) <= 0 then 2 else 1) + 2) + x, x, 2) - 1) - x
;; fast program: (((((((((loop(((((((((((((((((((2 + (((1 + 2) * (x div (2 + 2))) + x)) div 2) + 1) + (x mod 2)) div 2) + 2) - x) div 2) div 2) div 2) div 2) + 1) + 2) - x) div 2) div 2) + x) mod 2) + x, 2, x) + x) + 2) + x) + x) div 2) + x) + x) div (2 + 1)) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (ite (<= (modf x (+ 1 (* 2 (* 2 (- 2 (modf x 2)))))) 0) 2 1) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (- (v0 x) 1) x))))
(assert (forall ((x Int)) (= (f1 x) (+ (modf (+ (divf (divf (- (+ (+ (divf (divf (divf (divf (- (+ (divf (+ (+ (divf (+ 2 (+ (* (+ 1 2) (divf x (+ 2 2))) x)) 2) 1) (modf x 2)) 2) 2) x) 2) 2) 2) 2) 1) 2) x) 2) 2) x) 2) x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (+ (divf (+ (+ (+ (+ (v1 x) x) 2) x) x) 2) x) x) (+ 2 1)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
