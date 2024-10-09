;; sequence(s): A70485
;; terms: 0 1 8 4 18 10 9 21 6 16 11 20 3 12 7 17 2 14 13 5
;; small program: ((x * x) * x) mod (loop((2 + y) * x, 2, 2) - 1)
;; fast program: ((x * x) * x) mod ((2 * (2 * (2 + (2 + 2)))) - 1)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (modf (* (* x x) x) (- v0 1)))))
(assert (forall ((x Int)) (= (fast x) (modf (* (* x x) x) (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
