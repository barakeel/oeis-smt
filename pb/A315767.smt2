;; sequence(s): A315767
;; terms: 1 6 12 18 24 30 34 40 46 52 58 64 70 76 82 88 94 98 104 110
;; small program: ((loop((y - (x div (1 + (2 + 2)))) div 2, x + x, 1) + x) + x) * (if x <= 0 then 1 else 2)
;; fast program: ((((((1 + (2 + 2)) * (1 + (x + x))) div (1 + (2 + (2 * (2 + 2))))) + x) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (- y (divf x (+ 1 (+ 2 2)))) 2))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ (+ (v0 x) x) x) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (divf (* (+ 1 (+ 2 2)) (+ 1 (+ x x))) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
