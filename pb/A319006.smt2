;; sequence(s): A319006
;; terms: 1 3 8 18 34 57 89 132 187 255 338 438 556 693 851 1032 1237 1467 1724 2010
;; small program: (((2 + x) * loop(x + y, x, 1)) + (x div 2)) div 2
;; fast program: (((2 + ((x * x) + x)) * (2 + x)) + x) div (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (+ (* (+ 2 x) (v0 x)) (divf x 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (* (+ 2 (+ (* x x) x)) (+ 2 x)) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
