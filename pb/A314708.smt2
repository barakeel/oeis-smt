;; sequence(s): A314708
;; terms: 1 5 9 13 18 22 26 31 35 39 44 49 53 57 62 66 70 75 79 83
;; small program: (loop(((if ((((x div 2) div (1 + 2)) + x) mod (2 + 2)) <= 0 then 2 else 1) + 1) + x, x, 1) + x) + x
;; fast program: (((((2 + ((2 * (x div (2 + (2 * (2 + 2))))) + x)) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x
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
(assert (forall ((x Int)) (= (f0 x) (+ (+ (ite (<= (modf (+ (divf (divf x 2) (+ 1 2)) x) (+ 2 2)) 0) 2 1) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (divf (+ 2 (+ (* 2 (divf x (+ 2 (* 2 (+ 2 2))))) x)) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
