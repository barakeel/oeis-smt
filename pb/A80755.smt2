;; sequence(s): A80755
;; terms: 2 4 6 7 9 11 12 14 16 18 19 21 23 24 26 28 30 31 33 35
;; small program: (loop(((((y * y) div 2) + y) div (x * x)) + x, x, 1) + 1) + x
;; fast program: (((((2 * (2 + (2 * (2 + (2 + 2))))) * (1 + x)) + x) div ((((((2 + 2) * 2) + 2) * 2) * 2) + 1)) + 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (+ (divf (* y y) 2) y) (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (+ (* (* 2 (+ 2 (* 2 (+ 2 (+ 2 2))))) (+ 1 x)) x) (+ (* (* (+ (* (+ 2 2) 2) 2) 2) 2) 1)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
