;; sequence(s): A237616
;; terms: 0 1 18 66 160 315 546 868 1296 1845 2530 3366 4368 5551 6930 8520 10336 12393 14706 17290
;; small program: ((2 * (x * x)) - loop(x - y, x, 2)) * x
;; fast program: (((2 * (x * x)) - 2) + (((x * x) + x) div 2)) * x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (- (* 2 (* x x)) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (- (* 2 (* x x)) 2) (divf (+ (* x x) x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
