;; sequence(s): A283792
;; terms: 109 157 229
;; small program: (loop(1 + ((2 + x) * y), 2 + 2, (1 + x) * (2 + x)) div 2) + 1
;; fast program: (((((1 + 2) * (1 + (2 + x))) + (x * x)) * (2 + 2)) * (1 + 2)) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* (+ 2 x) y)))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) (* (+ 1 x) (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (divf (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (* (+ (* (+ 1 2) (+ 1 (+ 2 x))) (* x x)) (+ 2 2)) (+ 1 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
