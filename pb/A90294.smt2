;; sequence(s): A90294
;; terms: 5 35 93 187 325 515 765 1083 1477 1955 2525 3195 3973 4867 5885 7035 8325 9763 11357 13115
;; small program: (1 + 2) + loop(loop(2 + (x + y), 2 + y, x), x + x, 2)
;; fast program: (((1 + (x + x)) * (((1 + (2 + (2 + x))) * ((2 + x) * 2)) + 1)) div (1 + 2)) - 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ 2 y))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ 1 2) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (divf (* (+ 1 (+ x x)) (+ (* (+ 1 (+ 2 (+ 2 x))) (* (+ 2 x) 2)) 1)) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
