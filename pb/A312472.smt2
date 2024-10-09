;; sequence(s): A312472
;; terms: 1 4 8 14 18 22 26 30 34 40 44 48 52 56 62 66 70 74 78 82
;; small program: (((((1 + (2 * (2 + x))) div loop(1 + (x + x), 2, 2)) + x) * 2) + (if x <= 0 then 1 else x)) + x
;; fast program: (((((1 + (2 * (2 + x))) div (1 + (2 + (2 * (2 + 2))))) + x) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ (divf (+ 1 (* 2 (+ 2 x))) v0) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (divf (+ 1 (* 2 (+ 2 x))) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
