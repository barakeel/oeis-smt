;; sequence(s): A269112
;; terms: 3 5 11 21 33 47 65 87 111 137 167 201 237 275 317 363 411 461 515 573
;; small program: ((loop(((x + y) + y) + y, x, 2) div 2) * 2) + 1
;; fast program: (1 + 2) + (2 * (((1 + 2) * ((x * x) + x)) div (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x y) y) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (divf (v0 x) 2) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 2) (* 2 (divf (* (+ 1 2) (+ (* x x) x)) (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
