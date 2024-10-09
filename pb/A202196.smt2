;; sequence(s): A202196
;; terms: 240 640 1400 2688 4704 7680 11880 17600 25168 34944 47320 62720 81600 104448 131784 164160 202160 246400 297528 356224
;; small program: ((loop((((x + x) + x) div y) + x, 2 + x, 1 + (2 + x)) * 2) * 2) * 2
;; fast program: ((((1 + (2 + x)) * loop(((x * x) * x) - x, 1, 2 + (2 + x))) div (1 + 2)) * 2) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (+ (+ x x) x) y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (* (* (v0 x) 2) 2) 2))))
(assert (forall ((x Int)) (= (f1 x) (- (* (* x x) x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (* (divf (* (+ 1 (+ 2 x)) (v1 x)) (+ 1 2)) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
