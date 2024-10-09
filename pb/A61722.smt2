;; sequence(s): A61722
;; terms: 7 17 47 97 167 257 367 497 647 817 1007 1217 1447 1697 1967 2257 2567 2897 3247 3617
;; small program: loop((((x * y) * y) + x) + y, 2, x * x)
;; fast program: 2 + ((1 + (2 + 2)) * (1 + (2 * (x * x))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* (* x y) y) x) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (* (+ 1 (+ 2 2)) (+ 1 (* 2 (* x x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
