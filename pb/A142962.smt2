;; sequence(s): A142962
;; terms: 4 26 81 184 350 594 931 1376 1944 2650 3509 4536 5746 7154 8775 10624 12716 15066 17689 20600
;; small program: loop(x + y, x, 2 * ((1 + x) * (2 + x))) * (1 + x)
;; fast program: (1 + x) * (((1 + x) * ((2 * (2 * (2 + x))) + x)) div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (* 2 (* (+ 1 x) (+ 2 x))))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 x) (divf (* (+ 1 x) (+ (* 2 (* 2 (+ 2 x))) x)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
