;; sequence(s): A179436
;; terms: 7 25 52 88 133 187 250 322 403 493 592 700 817 943 1078 1222 1375 1537 1708 1888
;; small program: loop(2 + (x + y), 2 + ((x + x) + x), 0)
;; fast program: ((1 + 2) * ((1 + 2) * (((1 + x) * (2 + x)) div 2))) - 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ (+ x x) x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 2) (* (+ 1 2) (divf (* (+ 1 x) (+ 2 x)) 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
