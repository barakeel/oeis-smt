;; sequence(s): A33366
;; terms: 46 23 15 11 9 7 6 5 5 4 4 3 3 3 3 2 2 2 2 2
;; small program: (loop((x + y) * x, 2, 2) - 2) div (1 + x)
;; fast program: ((2 * (2 * (2 * (2 + (2 + 2))))) - 2) div (1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ x y) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (divf (- v0 2) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (- (* 2 (* 2 (* 2 (+ 2 (+ 2 2))))) 2) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
