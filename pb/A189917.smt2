;; sequence(s): A189917
;; terms: 0 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76
;; small program: (((x * x) div loop(x * y, 2 + 2, 1 + x)) + x) * (2 + 2)
;; fast program: ((((if x <= 0 then 1 else x) - 1) div (2 * (2 * (2 + (2 + 2))))) + x) * (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (divf (* x x) (v0 x)) x) (+ 2 2)))))
(assert (forall ((x Int)) (= (fast x) (* (+ (divf (- (ite (<= x 0) 1 x) 1) (* 2 (* 2 (+ 2 (+ 2 2))))) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
