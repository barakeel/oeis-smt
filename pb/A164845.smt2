;; sequence(s): A164845
;; terms: 3 11 27 54 95 153 231 332 459 615 803 1026 1287 1589 1935 2328 2771 3267 3819 4430
;; small program: 1 + (2 + (loop(x + y, 2 + x, 2) * x))
;; fast program: ((1 + x) * (2 + ((2 + x) * (2 + x)))) div 2
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
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ 2 (* (v0 x) x))))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ 1 x) (+ 2 (* (+ 2 x) (+ 2 x)))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
