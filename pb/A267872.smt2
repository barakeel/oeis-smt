;; sequence(s): A267872
;; terms: 1 1 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39
;; small program: 1 + ((2 mod (1 + x)) * x)
;; fast program: 1 + (2 * loop(0, 2 - x, x))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (* (modf 2 (+ 1 x)) x)))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (v0 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
