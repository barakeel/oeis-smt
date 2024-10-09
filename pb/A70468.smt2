;; sequence(s): A70468
;; terms: 0 1 4 9 16 25 36 3 18 35 8 29 6 31 12 41 26 13 2 39
;; small program: (x * x) mod (loop((x + y) * x, 2, 2) - 2)
;; fast program: (x * x) mod ((2 * (2 * (2 * (2 + (2 + 2))))) - 2)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
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
(assert (forall ((x Int)) (= (small x) (modf (* x x) (- v0 2)))))
(assert (forall ((x Int)) (= (fast x) (modf (* x x) (- (* 2 (* 2 (* 2 (+ 2 (+ 2 2))))) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
