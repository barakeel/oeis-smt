;; sequence(s): A134171
;; terms: 0 0 0 27 108 270 540 945 1512 2268 3240 4455 5940 7722 9828 12285 15120 18360 22032 26163
;; small program: loop((x - 2) + y, (x + x) + x, 0) * (x - 2)
;; fast program: ((1 + 2) * ((1 + 2) * (x - 2))) * (((x * x) - x) div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x 2) y))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ x x) x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (- x 2)))))
(assert (forall ((x Int)) (= (fast x) (* (* (+ 1 2) (* (+ 1 2) (- x 2))) (divf (- (* x x) x) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
