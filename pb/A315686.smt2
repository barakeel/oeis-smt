;; sequence(s): A315686
;; terms: 1 6 12 17 22 27 33 38 43 48 54 60 66 72 77 82 87 93 98 103
;; small program: ((((loop(((((((x * x) - 1) div (2 * (2 * (2 + 2)))) + x) mod 2) + 1) + x, x, 2) - 1) + x) + x) + x) + x
;; fast program: (((((((((((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + (2 * (2 + 2))))) + x) + x) + (x div (1 + (2 + (2 * (2 + 2)))))) * (1 + 2)) div 2) + 2) + x) + x) + x) + x) * (1 + 2)) div 2) div 2
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
(assert (forall ((x Int)) (= (f0 x) (+ (+ (modf (+ (divf (- (* x x) 1) (* 2 (* 2 (+ 2 2)))) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (- (v0 x) 1) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (divf (divf (* (+ (+ (+ (+ (+ (divf (* (+ (+ (+ (divf (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) x) (divf x (+ 1 (+ 2 (* 2 (+ 2 2)))))) (+ 1 2)) 2) 2) x) x) x) x) (+ 1 2)) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
