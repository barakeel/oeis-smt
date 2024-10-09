;; sequence(s): A297466
;; terms: 3 7 10 13 17 20 23 26 30 33 37 40 43 47 50 53 56 60 63 67
;; small program: ((loop(((((if ((x mod (1 + 2)) mod 2) <= 0 then x else 1) div 2) mod 2) + x) + 1, x, 2) + 1) + x) + x
;; fast program: (((((((if (((x mod (1 + (2 * (2 + 2)))) - 2) - 2) <= 0 then 2 else 1) + x) div (1 + 2)) + 1) + 2) + x) + x) + x
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
(assert (forall ((x Int)) (= (f0 x) (+ (+ (modf (divf (ite (<= (modf (modf x (+ 1 2)) 2) 0) x 1) 2) 2) x) 1))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) 1) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (divf (+ (ite (<= (- (- (modf x (+ 1 (* 2 (+ 2 2)))) 2) 2) 0) 2 1) x) (+ 1 2)) 1) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
