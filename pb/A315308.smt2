;; sequence(s): A315308
;; terms: 1 6 10 16 20 26 30 36 40 46 52 56 62 66 72 76 82 86 92 98
;; small program: (((((1 + (loop(x div (1 + 2), 2, x) + x)) div 2) + x) + x) * 2) + (if x <= 0 then 1 else 0)
;; fast program: ((((((2 * (2 - (x + x))) div (1 + (2 * (2 + 2)))) + x) + x) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (divf x (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (+ (divf (+ 1 (+ (v0 x) x)) 2) x) x) 2) (ite (<= x 0) 1 0)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (+ (divf (* 2 (- 2 (+ x x))) (+ 1 (* 2 (+ 2 2)))) x) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
