;; sequence(s): A311434
;; terms: 1 4 8 12 17 21 25 29 34 38 42 46 50 54 58 63 67 71 75 80
;; small program: (((loop((if ((((x * x) mod (1 + (2 * (2 + (2 + 2))))) mod (2 + 2)) - 2) <= 0 then 1 else 2) + x, x - 1, 2) - 1) + x) + x) + x
;; fast program: (((((((((((((x + x) + x) div (1 + (2 + (2 * (2 + 2))))) * 2) + 1) + x) - (if x <= 0 then 0 else 2)) + x) + x) div (1 + 2)) + 1) + x) + x) + x
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
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (- (modf (modf (* x x) (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 2 2)) 2) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (divf (+ (+ (- (+ (+ (* (divf (+ (+ x x) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 2) 1) x) (ite (<= x 0) 0 2)) x) x) (+ 1 2)) 1) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
