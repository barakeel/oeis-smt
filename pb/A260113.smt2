;; sequence(s): A260113
;; terms: 1 2 3 4 5 8 9 10 12 13 14 16 17 18 20 21 22 24 25 26
;; small program: loop(2 + y, (x - 2) div (1 + 2), 1) + x
;; fast program: (((1 + (if ((x - 2) - 2) <= 0 then 1 else x)) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 y))))
(assert (forall ((x Int)) (= (g0 x) (divf (- x 2) (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ 1 (ite (<= (- (- x 2) 2) 0) 1 x)) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
