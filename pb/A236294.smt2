;; sequence(s): A236294
;; terms: 1 1 2 3 3 5 6 7 9 10 12 14 15 18 20 22 25 27 30 33
;; small program: ((loop((((y * y) - (x mod 2)) div (2 + 2)) div 2, x, 0) + 2) + x) div 2
;; fast program: (((((x * x) + ((1 - ((x div 2) mod (2 + 2))) + (x mod 2))) div (2 * (2 + 2))) + x) + 2) div 2
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (divf (- (* y y) (modf x 2)) (+ 2 2)) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (+ (+ (v0 x) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (divf (+ (* x x) (+ (- 1 (modf (divf x 2) (+ 2 2))) (modf x 2))) (* 2 (+ 2 2))) x) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
