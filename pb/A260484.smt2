;; sequence(s): A260484
;; terms: 3 7 11 14 18 22 25 29 33 36 40 44 47 51 55 58 62 66 69 73
;; small program: loop(1 + (x + x), 2, x) - (x div (1 + 2))
;; fast program: 1 + (2 + ((2 * (x + x)) - (x div (1 + 2))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) (divf x (+ 1 2))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (- (* 2 (+ x x)) (divf x (+ 1 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
