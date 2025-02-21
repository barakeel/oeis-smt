;; sequence(s): A228157
;; terms: 12 23 34 45 56 67 78 89 101 112 123 134 145 156 167 178 189 201 212 223
;; small program: (((1 + x) * loop(1 + ((2 + x) * x), 2, 2)) div (1 + (2 * (2 + 2)))) + 1
;; fast program: ((2 * (2 * ((1 + 2) * (1 + x)))) - x) + ((1 + x) div (1 + (2 * (2 + 2))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* (+ 2 x) x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (divf (* (+ 1 x) v0) (+ 1 (* 2 (+ 2 2)))) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* 2 (* 2 (* (+ 1 2) (+ 1 x)))) x) (divf (+ 1 x) (+ 1 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
