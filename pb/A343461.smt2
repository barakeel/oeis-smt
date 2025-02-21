;; sequence(s): A343461
;; terms: 6 4 3 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
;; small program: 2 + ((2 + 2) div (1 + x))
;; fast program: loop(2 + (y - (x mod 2)), (2 + 2) - x, 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (divf (+ 2 2) (+ 1 x))))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (- y (modf x 2))))))
(assert (forall ((x Int)) (= (g0 x) (- (+ 2 2) x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
