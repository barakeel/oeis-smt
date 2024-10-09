;; sequence(s): A100188
;; terms: 1 6 27 84 205 426 791 1352 2169 3310 4851 6876 9477 12754 16815 21776 27761 34902 43339 53220
;; small program: (1 + x) * loop(((y * y) + x) + y, x, 1)
;; fast program: (1 + (((1 + x) * ((2 + x) * x)) div (1 + 2))) * (1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* y y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (divf (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2))) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
