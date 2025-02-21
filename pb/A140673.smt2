;; sequence(s): A140673
;; terms: 0 9 21 36 54 75 99 126 156 189 225 264 306 351 399 450 504 561 621 684
;; small program: (1 + 2) * (loop(x + y, x, x) + x)
;; fast program: (1 + 2) * (((((x * x) + x) div 2) + x) + x)
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
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 2) (+ (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (+ (+ (divf (+ (* x x) x) 2) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
