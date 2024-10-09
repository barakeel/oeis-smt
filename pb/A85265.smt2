;; sequence(s): A85265
;; terms: 2 3 4 5 6 7 8 9 10 11 12 14 15 16 17 18 19 20 21 22
;; small program: 1 + ((if loop(x - y, 2 + 2, x) <= 0 then 1 else 2) + x)
;; fast program: 1 + ((if ((x - 2) - (2 * (2 + 2))) <= 0 then 1 else 2) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (ite (<= (v0 x) 0) 1 2) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (ite (<= (- (- x 2) (* 2 (+ 2 2))) 0) 1 2) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
