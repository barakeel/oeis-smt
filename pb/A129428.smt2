;; sequence(s): A129428
;; terms: 1 48 142 283 471 706 988 1317 1693 2116 2586 3103 3667 4278 4936 5641 6393 7192 8038 8931
;; small program: loop(((loop((x + y) * x, 2, 2) * y) - y) + x, x, 1)
;; fast program: 1 + (((2 * (2 * (2 * (2 + (2 + 2))))) - 1) * (((x * x) + x) div 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* (+ x y) x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* v1 y) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (- (* 2 (* 2 (* 2 (+ 2 (+ 2 2))))) 1) (divf (+ (* x x) x) 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
