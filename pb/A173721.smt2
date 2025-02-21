;; sequence(s): A173721
;; terms: 0 0 1 2 4 8 13 20 29 41 55 72 93 117 145 177 214 255 301 353
;; small program: loop((y * y) + x, x, 2) div (1 + (2 + (2 + 2)))
;; fast program: (1 + (((1 + (x + x)) * ((x * x) + x)) div (2 + (2 * (2 + (2 + 2)))))) div (1 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (v0 x) (+ 1 (+ 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (divf (+ 1 (divf (* (+ 1 (+ x x)) (+ (* x x) x)) (+ 2 (* 2 (+ 2 (+ 2 2)))))) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
