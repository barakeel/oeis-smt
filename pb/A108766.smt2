;; sequence(s): A108766
;; terms: ~1 1 7 19 39 69 111 167 239 329 439 571 727 909 1119 1359 1631 1937 2279 2659
;; small program: 0 - loop((x - (y * y)) - y, x, 1)
;; fast program: (((1 + x) * ((2 + x) * x)) div (1 + 2)) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (- x (* y y)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- 0 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (divf (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
