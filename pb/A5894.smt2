;; sequence(s): A5894
;; terms: 1 5 15 35 69 121 195 295 425 589 791 1035 1325 1665 2059 2511 3025 3605 4255 4979
;; small program: 1 + (2 * loop((y * y) + x, x, x))
;; fast program: ((1 + (2 + ((x * x) + x))) * (1 + (x + x))) div (1 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (* 2 (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ 1 (+ 2 (+ (* x x) x))) (+ 1 (+ x x))) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
