;; sequence(s): A47409
;; terms: 0 1 4 6 8 9 12 14 16 17 20 22 24 25 28 30 32 33 36 38
;; small program: ((x mod (((x div 2) mod 2) - 2)) + x) + x
;; fast program: loop(x - 1, 1 - ((x - 1) mod (2 + 2)), x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (modf x (- (modf (divf x 2) 2) 2)) x) x))))
(assert (forall ((x Int)) (= (f0 x) (- x 1))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (modf (- x 1) (+ 2 2))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
