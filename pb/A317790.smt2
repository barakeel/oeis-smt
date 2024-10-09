;; sequence(s): A317790
;; terms: 1 1 7 7 13 19 31 37 49 61 79 91 109 127 151 169 193 217 247 271
;; small program: (((loop((y div 2) + x, x, 1) div 2) * 2) * (1 + 2)) + 1
;; fast program: (((1 + (((x * x) - 2) div (2 * (2 + 2)))) * (1 + 2)) * 2) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf y 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (* (divf (v0 x) 2) 2) (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (* (+ 1 (divf (- (* x x) 2) (* 2 (+ 2 2)))) (+ 1 2)) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
