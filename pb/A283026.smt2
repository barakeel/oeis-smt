;; sequence(s): A283026
;; terms: 0 1 3876 1929501 183181376 6419043125 118091211876 1388168405001 11745311589376 77279801651001 416916712502500 1915356782994501 7705740009485376 27731516944463501 90762229896563876 273716119247180625 768684707117285376 2027695320242670001
;; small program: loop(((x * x) - x) div 2, 2, 2 + loop(x * x, 2, x)) div (1 + 2)
;; fast program: loop((loop(((x * x) * x) - x, 1, 2 + x) * x) div (2 * (2 * (2 + (2 + 2)))), 1, ((x * x) * x) * x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (divf (- (* x x) x) 2))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (h0 x) (+ 2 (v1 x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (v0 x) (+ 1 2)))))
(assert (forall ((x Int)) (= (f3 x) (- (* (* x x) x) x))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (divf (* (v3 x) x) (* 2 (* 2 (+ 2 (+ 2 2))))))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (* (* (* x x) x) x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (v2 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
