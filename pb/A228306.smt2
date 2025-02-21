;; sequence(s): A228306
;; terms: 75 165 315 546 882 1350 1980 2805 3861 5187 6825 8820 11220 14076 17442 21375 25935 31185 37191 44022
;; small program: ((loop((2 + (2 + (2 + x))) * (((x * x) * x) - x), 1, 2 + (2 + x)) div 2) div 2) div 2
;; fast program: loop((2 + (2 + (2 + x))) * (((x * x) * x) - x), 1, 2 + (2 + x)) div (2 * (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
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
(assert (forall ((x Int)) (= (f0 x) (* (+ 2 (+ 2 (+ 2 x))) (- (* (* x x) x) x)))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 2 (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (divf (divf (v0 x) 2) 2) 2))))
(assert (forall ((x Int)) (= (f1 x) (* (+ 2 (+ 2 (+ 2 x))) (- (* (* x x) x) x)))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (v1 x) (* 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
