;; sequence(s): A311426
;; terms: 1 4 8 12 17 21 25 29 33 38 42 46 50 54 58 62 67 71 75 79
;; small program: ((((((((2 * (x + x)) - ((x div 2) mod 2)) div (1 + 2)) + 1) + x) div (if x <= 0 then 1 else 2)) + x) + x) + x
;; fast program: (((((((1 + (loop(0, (x mod (2 + 2)) - 2, 2) + x)) div (1 + 2)) + x) + x) div (if x <= 0 then 1 else 2)) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (divf (+ (+ (divf (- (* 2 (+ x x)) (modf (divf x 2) 2)) (+ 1 2)) 1) x) (ite (<= x 0) 1 2)) x) x) x))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- (modf x (+ 2 2)) 2))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (+ (+ (divf (+ 1 (+ (v0 x) x)) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
