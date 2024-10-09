;; sequence(s): A184527
;; terms: 4 10 16 23 29 35 41 47 54 60 66 72 78 85 91 97 103 109 115 122
;; small program: (((loop(((x + x) + x) + y, 2 + 2, x) * 2) - x) + 1) div loop(((x + x) + x) + 2, 2, 2)
;; fast program: (((((((((((((2 * (x + x)) + x) div (1 + (2 * (2 + (2 + 2))))) + 1) + x) + x) div 2) + x) + x) + 2) + x) + x) + 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x x) x) y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (f1 x) (+ (+ (+ x x) x) 2))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (divf (+ (- (* (v0 x) 2) x) 1) v1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (+ (divf (+ (+ (+ (divf (+ (* 2 (+ x x)) x) (+ 1 (* 2 (+ 2 (+ 2 2))))) 1) x) x) 2) x) x) 2) x) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
